require "piu_piu"

describe PiuPiu do
  it "returns sharps if message is empty" do
    expect(piupiu).to eql("###")
  end

  it "returns wrapped message if message is defined" do
    expect(piupiu("Miu")).to eql("### Miu ###")
  end
end
