# encoding: utf-8
require "spec_helper"

describe Lumos::Wrapper do
  context "position" do
    it "returns surround if position was not defined" do
      expect(described_class.new("Aguamenti").position).to eq(:surround)
    end

    it "raises an ArgumentError exception if wrong position defined" do
      expect { described_class.new("Avada Kedavra", {position: :unknown}) }.to raise_error(ArgumentError)
    end
  end

  context "service methods" do
    it "instantiates class based on defined position" do
      expect(described_class.new("Alohomora", {position: :left}).formatter.class).to eq(Lumos::Formatters::Left)
    end
  end

  context "missing methods" do
    it "returns left positioned message" do
      expect(described_class.new("Anapneo").left).to eq("# Anapneo")
    end

    it "returns bottom positioned message" do
      expect(described_class.new("Aparecium").bottom).to eq("Aparecium\n#########")
    end
  end

  context "default_options" do
    it "returns default positioned message with delimiter changed" do
      described_class.default_options[:delimiter] = "@"
      expect(described_class.new("Avifors").result).to eq("@@@@@@@@@@@\n@         @\n@ Avifors @\n@         @\n@@@@@@@@@@@")
      end

    it "returns default positioned message with padding changed" do
      described_class.default_options[:padding] = 3
      expect(described_class.new("Avifors").result).to eq("@@@@@@@@@@@@@@@\n@             @\n@             @\n@             @\n@   Avifors   @\n@             @\n@             @\n@             @\n@@@@@@@@@@@@@@@")
    end

    it "returns message with position changed" do
      described_class.default_options[:position] = :horizontal
      expect(described_class.new("Avifors").result).to eq("@@@@@@@\n\n\n\nAvifors\n\n\n\n@@@@@@@")
    end

    it "returns message with bottom position and emoji delimiter" do
      described_class.default_options[:position]  = :bottom
      described_class.default_options[:delimiter] = ":poop:"
      expect(described_class.new("Avifors").result).to eq("Avifors\n\n\n\n💩💩💩💩💩💩💩")
    end
  end
end
