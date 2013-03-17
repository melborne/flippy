module Flippy::Vertical
  PUNC = ["、","。","，","．"]

  SYM = {
    "ー" => "｜",
    "「" => "¬",
    "」" => "∟",
    "→" => "↓",
    "↑" => "→",
    "←" => "↑",
    "↓" => "←",
    "＝" => "॥",
  	"…" => "："
  }

  SYM1 = (SYM.keys + SYM.values).join
  SYM2 = (SYM.values + SYM.keys).join

  def vertical
    lines = []
    self.tr(SYM1, SYM2)
        .each_line { |line|
          line.chomp!
          lines << line[1..-1].gsub(/[^#{PUNC.join}]/, '　')
          lines << line[0] + line[1..-1].gsub(/#{PUNC.join("|")}/, '')
        }

    max = lines.map(&:size).max
    lines.map { |line|
          Array.new(max, '　').tap { |arr| arr[0, line.size] = line.split(//) }
        }.transpose
         .map { |line| line.join.reverse }.join("\n")
  end
end
