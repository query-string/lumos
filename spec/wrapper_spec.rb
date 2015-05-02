# encoding: utf-8
require "spec_helper"

describe PiuPiu::Wrapper do
  context "delimiter defined" do
    it "returns message wrapped around with certain characters" do
      expect(described_class.new("Alohomora", {delimiter: "☢"}).wrapped_message).to eq("☢☢☢☢☢☢☢☢☢☢☢\n☢Alohomora☢\n☢☢☢☢☢☢☢☢☢☢☢")
    end
  end

  context "position defined" do
    it "returns message and left aligned delimiter" do
      expect(described_class.new("Anapneo", {position: :left}).wrapped_message).to eq("# Anapneo")
    end

    it "returns message and right aligned delimiter" do
      expect(described_class.new("Aparecium", {position: :right}).wrapped_message).to eq("Aparecium #")
    end

    it "returns message and top aligned delimiter" do
      expect(described_class.new("Avifors", {position: :top}).wrapped_message).to eq("#######\nAvifors")
    end

    it "returns message and bottom aligned delimiter" do
      expect(described_class.new("Crucio", {position: :bottom}).wrapped_message).to eq("Crucio\n######")
    end

    it "returns exception if positioning is wrong" do
      expect { piupiu_wrap "Avada Kedavra", {position: :unknown} }.to raise_error(ArgumentError)
    end
  end

  context "padding defined" do
    it "returns 2 padding wrapped message" do
      expect(described_class.new("Protego", {delimiter: "❄", position: :surround, padding: 2}).wrapped_message).to eq("❄❄❄❄❄❄❄❄❄❄❄❄❄\n❄  Protego  ❄\n❄❄❄❄❄❄❄❄❄❄❄❄❄")
    end
  end

  context "subsidary methods" do
    it "returns number of message characters" do
      expect(described_class.new("Defodio").count_chars).to eq(7)
    end

    it "returns delimiter line based on message size" do
      expect(described_class.new("Wingardium Leviosa").delimiter_line).to eq("##################")
    end

    it "returns delimiter line based on message size and padding" do
      expect(described_class.new("Wingardium Leviosa", {padding: 3}).delimiter_line).to eq("########################")
    end
  end
end
