require "piu_piu"

describe PiuPiu do
  include PiuPiu

  it "returns message" do
    expect(piupiu("Miu")).to eql("## Miu")
  end
end
