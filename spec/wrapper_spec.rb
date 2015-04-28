require "spec_helper"

describe PiuPiu::Wrapper do
  it "returns wrapped message" do
    expect(PiuPiu::Wrapper.new("Sawadicap!").wrapped_message).to eq("# Sawadicap! #")
  end
end
