# encoding: utf-8
require "spec_helper"

describe Lumos::Formatters::Horizontal do
  context "messages" do
    it "returns message" do
      expect { lumos "Meteolojinx Recanto", position: :horizontal }.to output("###################\nMeteolojinx Recanto\n###################\n").to_stdout
    end

    it "returns multiline message" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", position: :horizontal }.to output("######################################################################\nCoffee has long had a reputation as being unhealthy. But in almost eve\nry single respect that reputation is backward. The potential health be\nnefits are surprisingly large.\n######################################################################\n").to_stdout
    end

    it "returns multiline message with defined length" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", position: :horizontal, length: 35 }.to output("###################################\nCoffee has long had a reputation as\n being unhealthy. But in almost eve\nry single respect that reputation i\ns backward. The potential health be\nnefits are surprisingly large.\n###################################\n").to_stdout
    end
  end

  context "paddings" do
    it "returns zero-padding message" do
      expect { lumos "Mobilicorpus", position: :horizontal, padding: 0 }.to output("############\nMobilicorpus\n############\n").to_stdout
    end

    it "returns 1-digit message" do
      expect { lumos "Mobilicorpus", position: :horizontal, padding: 1 }.to output("############\n\nMobilicorpus\n\n############\n").to_stdout
    end

    it "returns 2-digits padding message" do
      expect { lumos "Mobilicorpus", position: :horizontal, padding: 2 }.to output("############\n\n\nMobilicorpus\n\n\n############\n").to_stdout
    end
  end

  context "delimiters" do
    it "returns delimiter message" do
      expect { lumos "Mobiliarbus", position: :horizontal, delimiter: "❄" }.to output("❄❄❄❄❄❄❄❄❄❄❄\nMobiliarbus\n❄❄❄❄❄❄❄❄❄❄❄\n").to_stdout
    end

    it "returns message with multichar delimiter" do
      expect { lumos "Mobiliarbus", position: :horizontal, delimiter: "=->" }.to output("=->=->=->=-\nMobiliarbus\n=->=->=->=-\n").to_stdout
    end
  end
end
