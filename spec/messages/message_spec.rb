# encoding: utf-8
require "spec_helper"

describe Lumos::Message do

  context "subsidary methods" do
    it "returns number of message characters" do
      expect(described_class.new(message: "Cave Inimicum").original_message_length).to eq(13)
    end

    it "returns number of short message lines" do
      expect(described_class.new(message: "Colloportus").chopped_message.size).to eq(1)
    end

    it "returns number of long message lines" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").chopped_message.size).to eq(3)
    end

    it "returns messages size based on lenght of first chopped line" do
      expect(described_class.new(message: "Confringo").chopped_message_length).to eq(9)
    end
  end

end
