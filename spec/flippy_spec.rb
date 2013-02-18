# encoding: UTF-8
require_relative 'spec_helper'

describe Flippy do
  describe "#flip" do
    context "single-line" do
      subject { "hello, world!".flip }
      it { should eq "¡plɹoʍ ‘olləɥ" }
    end

    context "multi-line" do
      subject { "hello\nworld!".flip }
      it { should eq "¡plɹoʍ\n olləɥ" }
    end

    context "multi-line2" do
      subject { "def ab\n  :ab\nend".flip }
      it { should eq "   puə\n qɐ:\nqɐ ɟəp" }
    end
  end

  describe "#unflip" do
    context "single-line" do
      subject { "¡plɹoʍ ‘olləɥ".unflip }
      it { should eq "hello, world!" }
    end

    context "multi-line" do
      subject { "¡plɹoʍ\n olləɥ".unflip }
      it { should eq "hello\nworld!" }
    end

    context "multi-line2" do
      subject { "   puə\n qɐ:  \nqɐ ɟəp".unflip }
      it { should eq "def ab\n  :ab\nend" }
    end
  end
end
