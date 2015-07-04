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

  context "default options" do
    it "returns top positioned message with changed delimiter" do
      described_class.default_options[:delimiter] = "@"
      expect(described_class.new("Avifors").top).to eq("@@@@@@@\nAvifors")
      end

    it "returns left positioned message with changed padding" do
      described_class.default_options[:padding] = 3
      expect(described_class.new("Avis").left).to eq("@   Avis")
    end

    it "returns horizontal positioned message" do
      described_class.default_options[:position] = :horizontal
      expect(described_class.new("Avis").result).to eq("@@@@\n\n\n\nAvis\n\n\n\n@@@@")
    end
  end
end
