require "spec_helper"

describe Lumos::SurroundMessage do

  it "returns message" do
    expect(described_class.new(message: "Defodio").message).to eq("###########\n#         #\n# Defodio #\n#         #\n###########")
  end

  it "returns message" do
    expect(described_class.new(message: "Defodio").message_line).to eq("###########")
  end

end
