# encoding: utf-8
require "spec_helper"

describe PiuPiu::Wrapper do
  context "delimiter defined" do
    it "returns message wrapped with certain characters" do
      expect(described_class.new("Alohomora", {delimiter: "@"}).wrapped_message).to eq("@@@@@@@@@@@\n@Alohomora@\n@@@@@@@@@@@")
    end
  end

  context "position defined" do
    it "returns message and left aligned delimiter" do
      expect(described_class.new("Anapneo", {delimiter: "❤", position: :left}).wrapped_message).to eq("❤ Anapneo")
    end

    it "returns message and right aligned delimiter" do
      expect(described_class.new("Aparecium", {delimiter: "♞", position: :right}).wrapped_message).to eq("Aparecium ♞")
    end

    it "returns message and top aligned delimiter" do
      expect(described_class.new("Avifors", {delimiter: "☎", position: :top}).wrapped_message).to eq("☎☎☎☎☎☎☎\nAvifors")
    end

    it "returns message and bottom aligned delimiter" do
      expect(described_class.new("Crucio", {delimiter: "☭", position: :bottom}).wrapped_message).to eq("Crucio\n☭☭☭☭☭☭")
    end

    it "returns exception if positioning is wrong" do
      expect { piupiu_wrap "Avada Kedavra", {delimiter: "☢", position: :unknown} }.to raise_error(ArgumentError)
    end
  end

  context "subsidary methods" do
    it "returns wrapped message" do
      expect(described_class.new("Accio").wrapped_message).to eq("#######\n#Accio#\n#######")
    end

    it "returns number of message characters" do
      expect(described_class.new("Defodio").count_chars).to eq(7)
    end
  end
end

