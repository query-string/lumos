# encoding: utf-8
require "spec_helper"

describe Lumos::Wrapper do
  context "position" do
    it "returns surround if position was not defined" do
      expect(described_class.new("Aguamenti").position).to eq(:surround)
    end

    it "raises an exception if wrong position defined" do
      expect { described_class.new("Avada Kedavra", {position: :unknown}) }.to raise_error(ArgumentError)
    end
  end

  context "service methods" do
    it "instantiates class based on defined position" do
      expect(described_class.new("Alohomora", {position: :left}).formatter.class).to eq(Lumos::Formatters::Left)
    end
  end
end
