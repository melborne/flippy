# encoding: UTF-8
require_relative 'spec_helper'

describe Flippy do
  describe "#vertical" do
    context "with any strings" do
      subject { "こんにちはー、\n日本。".vertical }
      it { should eq <<-EOS.chomp }
日　こ
本。ん
　　に
　　ち
　　は
　　｜、
EOS
    end

    context "with any strings(multiple punctuations)" do
      subject { "こんにちはー、\n日本。人。".vertical }
      it { should eq <<-EOS.chomp }
日　こ
本。ん
人。に
　　ち
　　は
　　｜、
EOS
  end

    context "with any strings(sequential multiple punctuations)" do
      subject { "今日は、、いい\n天気、です。。".vertical }
      it { should eq <<-EOS.chomp }
天　今
気、日
で　は、
す。　、
　。い
　　い
EOS
    end

    context "vertical horizontal mix string" do
      subject { "ニッポンの//自然".vertical }
      it { should eq <<-EOS.chomp }
ニ
ッ
ポ
ン
の自然
EOS
    end

    context "vertical horizontal mix string" do
      subject { "ニッポンの//自然//大切に。".vertical }
      it { should eq <<-EOS.chomp }
ニ
ッ
ポ
ン
の
/
/
自
然大切に。
EOS
  end

    context "with empty strings" do
      subject { "".vertical }
      it { should eq "" }
    end

    context "with CR" do
      subject { "\n".vertical }
      it { should eq "" }
    end

    context "immutable test" do
      it "should be immutable" do
        str = "こんにちは、\n日本。"
        str.vertical
        str.should eq "こんにちは、\n日本。"
      end
    end
  end
end
