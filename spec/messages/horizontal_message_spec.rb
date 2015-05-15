require "spec_helper"

describe Lumos::HorizontalMessage do
  it "returns message" do
    expect(described_class.new(message: "Defodio").message).to eq("#######\nDefodio\n#######")
  end
end
