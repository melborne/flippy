# encoding: UTF-8
require_relative 'spec_helper'

describe Flippy do
  describe "#vertical" do
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
end
