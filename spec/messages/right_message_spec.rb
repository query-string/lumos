require "spec_helper"

describe Lumos::RightMessage do
  it "returns message" do
    expect(described_class.new(message: "Defodio").message).to eq("Defodio #")
  end
end
