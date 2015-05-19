require "spec_helper"

describe Lumos::SurroundMessage do
  context "arguments" do
    it "returns wrapped message" do
      expect(described_class.new(message: "Defodio").message).to eq("###########\n#         #\n# Defodio #\n#         #\n###########")
    end

    it "returns delimiter message" do
      expect(described_class.new(message: "Deletrius", delimiter: "❤").message).to eq("❤❤❤❤❤❤❤❤❤❤❤❤❤\n❤           ❤\n❤ Deletrius ❤\n❤           ❤\n❤❤❤❤❤❤❤❤❤❤❤❤❤")
    end

    it "returns zero-padding message" do
      expect(described_class.new(message: "Densaugeo", padding: 0).message).to eq("###########\n#Densaugeo#\n###########")
    end

    it "returns 1-digit padding message" do
      expect(described_class.new(message: "Densaugeo", padding: 1).message).to eq("#############\n#           #\n# Densaugeo #\n#           #\n#############")
    end

    it "returns 2-digits padding message" do
      expect(described_class.new(message: "Densaugeo", padding: 2).message).to eq("###############\n#             #\n#             #\n#  Densaugeo  #\n#             #\n#             #\n###############")
    end

    it "returns multiline message" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").message).to eq("##########################################################################\n#                                                                        #\n# Coffee has long had a reputation as being unhealthy. But in almost eve #\n# ry single respect that reputation is backward. The potential health be #\n# nefits are surprisingly large.                                         #\n#                                                                        #\n##########################################################################")
    end

    it "returns multiline message with defined length" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", length: 35).message).to eq("#######################################\n#                                     #\n# Coffee has long had a reputation as #\n#  being unhealthy. But in almost eve #\n# ry single respect that reputation i #\n# s backward. The potential health be #\n# nefits are surprisingly large.      #\n#                                     #\n#######################################")
    end
  end

  context "self methods" do
    it "returns delimiter line" do
      expect(described_class.new(message: "Deprimo").line).to eq("###########")
    end

    it "returns offset" do
      expect(described_class.new(message: "Diffindo").offset).to eq("#          #\n")
    end

    it "returns body" do
      expect(described_class.new(message: "Dissendium").body).to eq("# Dissendium #")
    end
  end
end
