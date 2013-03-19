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

    context "with empty strings" do
      subject { "".vertical }
      it { should eq "" }
    end

    context "with CR" do
      subject { "\n".vertical }
      it { should eq "" }
    end
  end
end
