# encoding: utf-8
require "spec_helper"

describe Lumos::Wrapper do
  context "delimiter defined" do
    it "returns message wrapped around with certain characters" do
      expect(described_class.new("Alohomora", {delimiter: "☢"}).wrapped_message).to eq("☢☢☢☢☢☢☢☢☢☢☢☢☢\n☢           ☢\n☢ Alohomora ☢\n☢           ☢\n☢☢☢☢☢☢☢☢☢☢☢☢☢")
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
      expect { lumos_wrap "Avada Kedavra", {position: :unknown} }.to raise_error(ArgumentError)
    end

    it "returns message and horizontal aligned delimiter" do
      expect(described_class.new("Levicorpus", {position: :horizontal}).wrapped_message).to eq("##########\n\nLevicorpus\n\n##########")
    end

    it "returns message and vertical aligned delimiter" do
      expect(described_class.new("Expulso", {position: :vertical, delimiter: "♫"}).wrapped_message).to eq("♫ Expulso ♫")
    end
  end

  context "padding defined" do
    it "returns 2 padding wrapped message" do
      expect(described_class.new("Protego", {position: :surround, padding: 2, delimiter: "❄"}).wrapped_message).to eq("❄❄❄❄❄❄❄❄❄❄❄❄❄\n❄           ❄\n❄           ❄\n❄  Protego  ❄\n❄           ❄\n❄           ❄\n❄❄❄❄❄❄❄❄❄❄❄❄❄")
    end

    it "returns 1-line padding between devider and message" do
      expect(described_class.new("Expelliarmus", {position: :top, padding: 1}).wrapped_message).to eq("############\n\nExpelliarmus")
    end

    it "returns 2-line padding between devider and message" do
      expect(described_class.new("Morsmordre", {position: :top, padding: 2}).wrapped_message).to eq("##########\n\n\nMorsmordre")
    end

    it "returns 2-line padding between deviders and message" do
      expect(described_class.new("Accio", {position: :horizontal, padding: 2}).wrapped_message).to eq("#####\n\n\nAccio\n\n\n#####")
    end

    it "returns 1-whitespace padding between devider and message" do
      expect(described_class.new("Stupefy", {position: :left, padding: 1}).wrapped_message).to eq("# Stupefy")
    end

    it "returns 2-whitespace padding between devider and message " do
      expect(described_class.new("Imperio", {position: :right, padding: 2, delimiter: "->"}).wrapped_message).to eq("Imperio  ->")
    end

    it "returns 2-whitespace padding between deviders and message" do
      expect(described_class.new("Riddikulus", {position: :vertical, padding: 2}).wrapped_message).to eq("#  Riddikulus  #")
    end
  end

  context "subsidary methods" do
    it "returns number of message characters" do
      expect(described_class.new("Defodio").count_chars).to eq(7)
    end
  end
end
