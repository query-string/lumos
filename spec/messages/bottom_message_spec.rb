require "spec_helper"

describe Lumos::BottomMessage do
  it "returns message" do
    expect(described_class.new(message: "Defodio").message).to eq("Defodio\n#######")
  end
end
