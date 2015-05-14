require "spec_helper"

describe Lumos::Message do

  context "subsidary methods" do
    it "returns number of message characters" do
      expect(described_class.new(message: "Defodio").original_message_length).to eq(7)
    end

    it "returns number of short message lines" do
      expect(described_class.new(message: "Incendio").chopped_message.size).to eq(1)
    end

    it "returns number of long message lines" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").chopped_message.size).to eq(2)
    end

    it "returns messages size based on lenght of first chopped line" do
      expect(described_class.new(message: "Lumos Maximus").chopped_message_length).to eq(13)
    end
  end

end
