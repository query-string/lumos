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

=begin
  context "long strings chopping" do
    it "returns 4-lines wrapped message" do
      expect(described_class.new('When I was a kid, my parents refused to let me drink coffee because they believed it would “stunt my growth.” It turns out, of course, that this is a myth. Studies have failed, again and again, to show that coffee or caffeine consumption are related to reduced bone mass or how tall people are.').wrapped_message).to eq("############\n\nExpelliarmus")
    end
  end
=end

  context "subsidary methods" do
    it "returns number of message characters" do
      expect(described_class.new("Defodio").message_length).to eq(7)
    end

    it "returns number of short message lines" do
      expect(described_class.new("Incendio").message_lines.size).to eq(1)
    end

    it "returns number of long message lines" do
      expect(described_class.new("Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").message_lines.size).to eq(2)
    end

    it "returns message size based on lenght of first chopped line" do
      expect(described_class.new("Lumos Maximus").message_line_length).to eq(13)
    end
  end
end
