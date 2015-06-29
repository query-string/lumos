# encoding: utf-8
require "spec_helper"

describe Lumos::Formatters::Surround do
  context "messages" do
    it "returns wrapped message" do
      expect { lumos "Defodio" }.to output("###########\n#         #\n# Defodio #\n#         #\n###########\n").to_stdout
    end

    it "returns multiline message" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large." }.to output("##########################################################################\n#                                                                        #\n# Coffee has long had a reputation as being unhealthy. But in almost eve #\n# ry single respect that reputation is backward. The potential health be #\n# nefits are surprisingly large.                                         #\n#                                                                        #\n##########################################################################\n").to_stdout
    end

    it "returns multiline message with defined length" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", length: 35 }.to output("#######################################\n#                                     #\n# Coffee has long had a reputation as #\n#  being unhealthy. But in almost eve #\n# ry single respect that reputation i #\n# s backward. The potential health be #\n# nefits are surprisingly large.      #\n#                                     #\n#######################################\n").to_stdout
    end
  end

  context "paddings" do
    it "returns zero-digit padding message" do
      expect { lumos "Densaugeo", padding: 0 }.to output("###########\n#Densaugeo#\n###########\n").to_stdout
    end

    it "returns 1-digit padding message" do
      expect { lumos "Densaugeo", padding: 1 }.to output("#############\n#           #\n# Densaugeo #\n#           #\n#############\n").to_stdout
    end

    it "returns 2-digits padding message" do
      expect { lumos "Densaugeo", padding: 2 }.to output("###############\n#             #\n#             #\n#  Densaugeo  #\n#             #\n#             #\n###############\n").to_stdout
    end
  end

  context "delimiters" do
    it "returns delimiter message" do
      expect { lumos "Deletrius", delimiter: "❤" }.to output("❤❤❤❤❤❤❤❤❤❤❤❤❤\n❤           ❤\n❤ Deletrius ❤\n❤           ❤\n❤❤❤❤❤❤❤❤❤❤❤❤❤\n").to_stdout
    end

    it "returns message with multichar delimiter" do
      expect { lumos "Deletrius", delimiter: "=->" }.to output("=->=->=->=->=->=-\n=->           =->\n=-> Deletrius =->\n=->           =->\n=->=->=->=->=->=-\n").to_stdout
    end
  end
end
