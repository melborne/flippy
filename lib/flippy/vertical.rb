# encoding: UTF-8
module Flippy::Vertical
  PUNC = %w(、 。 ， ．)
  h = "ー「」→↑←↓＝…"
  v = "｜¬∟↓→↑←॥："
  HV = (h + v)
  VH = (v + h)

  def vertical
    lines = []
    self.tr(HV, VH)
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
         .map { |line| line.join.reverse }.join("\n")
  end
end
