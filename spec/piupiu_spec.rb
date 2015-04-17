require "piupiu"

describe Piupiu do
  it "returns message" do
    expect(Piupiu.piu_piu("Miu")).to eql("## Miu")
  end
end
