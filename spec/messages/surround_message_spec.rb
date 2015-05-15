require "spec_helper"

describe Lumos::SurroundMessage do
  it "returns message" do
    expect(described_class.new(message: "Defodio").message).to eq("###########\n#         #\n# Defodio #\n#         #\n###########")
  end

  it "returns delimiter line" do
    expect(described_class.new(message: "Defodio").line).to eq("###########")
  end

  it "returns padding" do
  end

  it "returns body" do
  end
end
