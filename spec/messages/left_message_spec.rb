require "spec_helper"

describe Lumos::LeftMessage do
  it "returns message" do
    expect(described_class.new(message: "Engorgio").message).to eq("# Engorgio")
  end
end
