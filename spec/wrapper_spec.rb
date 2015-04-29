require "spec_helper"

describe PiuPiu::Wrapper do
  it "returns wrapped message" do
    expect(PiuPiu::Wrapper.new("Accio").wrapped_message).to eq("# Accio #")
    end

  it "returns number of message characters" do
    expect(PiuPiu::Wrapper.new("Defodio").count_chars).to eq(7)
  end
end
