# encoding: UTF-8
module Flippy::Vertical
  PUNC = %w(、 。 ， ．)
  h = "ー「」→↑←↓＝…"
  v = "｜¬∟↓→↑←॥："
  HV = (h + v)
  VH = (v + h)
  H_SEP = '//'

  # Convert to left-right vertical writing style.
  #
  #   "Hi\nFo".vertical => "F H "
  #                        "o i "
  #
  # Last part after "//" symbol is taken as a normal writing part.
  #
  #   "Hi\nFo//by me".vertical => "F H "
  #                               "o i by me"
  #
  def vertical
    lines = []
    v_part, _, h_part = self.rpartition(H_SEP).reject(&:empty?)
    v_part.to_s.tr(HV, VH)
        .each_line do |line|
          main_line, punc_line = [], []
          line.chomp.each_char.with_index do |chr, i|
            if i.zero? || !PUNC.include?(chr)
              main_line << chr
              punc_line << '　'
            else
              punc_line[-1] = chr
            end
          end
          lines << punc_line << main_line
        end

    max = lines.map(&:size).max
    lines.map { |line| line.fill('　', line.size...max) }
         .transpose
         .map { |line| line.join.reverse }.join("\n").concat("#{h_part}")
  end
end
