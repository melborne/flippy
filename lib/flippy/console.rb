require "termios"

$stdin.extend Termios

# On your terminal, try `flippy -c` then type normally.
# <ESC> key to exit.
# ^R, ^G, ^B, ^E are for setting color.
# ^F is for flush screen.
module Flippy::Console
  class << self
    def run
      buffer = ""
      terminal do
        clear
        move_to_top
        while chr = $stdin.getc
          clear
          case chr
          when escape_key?
            exit
          when back_key?
            buffer.chop!
          when *%w(R G B).map { |ch| ctr_with ch }
            set_color(chr)
          when ctr_with('E')
            reset_color
          when ctr_with('F')
            buffer.clear
          else
            buffer << chr
          end
          flipped = buffer.flip
          print flipped
          reset_cursor(flipped)
        end
      end
    end

    private
    # Configuire terminal with non-echo & non-canonical
    def terminal
      begin
        term_preset = $stdin.tcgetattr
        term = term_preset.dup
        [Termios::ICANON, Termios::ECHO].each { |flag| term.lflag &= ~flag }
        $stdin.tcsetattr(Termios::TCSANOW, term)
        yield
      ensure
        $stdin.tcsetattr(Termios::TCSANOW, term_preset)
      end
    end

    def clear
      print "\e[2J"
    end

    def move_to_top
      print "\e[0;0H"
    end

    def escape_key?
      ->chr{ chr.ord == 27 } # <ESC>
    end

    def back_key?
      ->chr{ [127, 8].include?(chr.ord) } # ^H or delete
    end

    def ctr_with(key)
      raise 'only A-Z acceptable' unless key.ord.between?(65, 90)
      ->chr{ chr.ord == key.ord-64 }
    end

    def set_color(key)
      key = COL( (key.ord+64).chr )
      print "\e[#{key}m" if key
    end

    def reset_color
      print "\e[0m"
    end

    def reset_cursor(str)
      lastline = str.split("\n").first || ""
      print "\e[#{lastline.size}D"    # Backward cursor
      y = str.count("\n")
      print "\e[#{y}A" if y > 0       # Up cursor
    end

    def COL(key)
      t = %w(red green yellow blue magenta cyan white).zip(31..37)
      t.detect { |k, v| k.start_with?("#{key}".downcase) }
       .tap { |k, v| break k ? v : nil }
    end
  end
end
