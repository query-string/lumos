require "spec_helper"

describe Lumos::HorizontalMessage do
  it "returns message" do
    expect(described_class.new(message: "Meteolojinx Recanto").message).to eq("###################\nMeteolojinx Recanto\n###################")
  end
end
