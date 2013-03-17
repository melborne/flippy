# encoding: UTF-8
# Fippy makes a text upside down, like "twitter" to "ɹəʇʇᴉʍʇ".
#
# Copyright (c) 2013 kyoendo / MIT License
#
# The table data is based on a following blog by Fumiaki Nishihara.
#   twitter→ɹəʇʇɪʍʇのように英数字を180度回転して表示する方法｜Colorless Green Ideas
#   http://id.fnshr.info/2013/01/25/upsidedowntext/

require_relative "flippy/version"
require_relative "flippy/console"
require_relative "flippy/vertical"

module Flippy
  include Vertical
  T = [[65, 5572], [66, 5626], [67, 390], [68, 5601], [69, 398], [70, 8498], [71, 8513], [72, 72], [73, 73], [74, 5259], [75, 20012], [76, 8514], [77, 87], [78, 78], [79, 79], [80, 1280], [81, 908], [82, 7450], [83, 83], [84, 8869], [85, 1352], [86, 923], [87, 77], [88, 88], [89, 8516], [90, 90], [97, 592], [98, 113], [99, 596], [100, 112], [101, 601], [102, 607], [103, 595], [104, 613], [105, 7433], [106, 638], [107, 670], [108, 108], [109, 623], [110, 117], [111, 111], [112, 100], [113, 98], [114, 633], [115, 115], [116, 647], [117, 110], [118, 652], [119, 653], [120, 120], [121, 654], [122, 122], [48, 48], [49, 8642], [50, 423], [51, 949], [52, 5421], [53, 53], [54, 57], [55, 76], [56, 56], [57, 54], [46, 729], [44, 8216], [45, 45], [58, 58], [59, 1563], [33, 161], [63, 191], [38, 8523], [40, 41], [41, 40], [60, 62], [62, 60], [91, 93], [93, 91], [95, 8254], [8254, 95], [123, 125], [125, 123], [8756, 8757], [8757, 8756]]

  def self.table
    T.map do |kv|
      kv.map { |code| "%s(U+%04x)" % [code.chr('UTF-8'), code]}
        .join(" => ")
    end
  end

  def flip
    flip_or_unflip { |chr| _flip chr }
  end

  def unflip
    flip_or_unflip { |chr| _unflip chr }
  end

  private
  def flip_or_unflip
    margin chars.map { |chr| yield chr }.join.reverse
  end

  def _flip(chr)
    _, code = T.assoc(chr.ord)
    code ? code.chr('UTF-8') : chr
  end

  def _unflip(chr)
    code, _ = T.rassoc(chr.ord)
    code ? code.chr('UTF-8') : chr
  end

  def margin(str)
    return str unless str.match(/\n|\r/)
    max = 0
    str.split("\n").tap { |ls| max = ls.map(&:size).max }
       .map { |l| ' ' * (max-l.size) + l.rstrip }.join("\n")
  end
end

String.send(:include, Flippy)

module Kernel
  def stnd(*args)
    puts *args.flatten.map { |arg| "#{arg}".flip }
  end
end

if __FILE__ == $0
  flipped = "twitter".flip # => "ɹəʇʇᴉʍʇ"
  flipped.unflip # => "twitter"
  flipped_number = '1234567890'.flip # => "068L95ᔭεƧ⇂"
  flipped_number.unflip # => "1234567890"
end
