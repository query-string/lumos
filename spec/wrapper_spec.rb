require "spec_helper"

describe PiuPiu::Wrapper do
  it "returns wrapped message" do
    expect { PiuPiu::Wrapper.new "Sawadicap!" }.to output("\"# Sawadicap! #\"\n").to_stdout
  end
end
