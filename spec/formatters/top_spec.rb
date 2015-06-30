# encoding: utf-8
require "spec_helper"

describe Lumos::Formatters::Top do
  context "messages" do
    it "returns wrapped message" do
      expect { lumos "Immobulus", position: :top }.to output("#########\nImmobulus\n").to_stdout
    end

    it "returns multiline message" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", position: :top }.to output("######################################################################\nCoffee has long had a reputation as being unhealthy. But in almost eve\nry single respect that reputation is backward. The potential health be\nnefits are surprisingly large.\n").to_stdout
    end

    it "returns multiline message with defined length" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", position: :top, length: 35 }.to output("###################################\nCoffee has long had a reputation as\n being unhealthy. But in almost eve\nry single respect that reputation i\ns backward. The potential health be\nnefits are surprisingly large.\n").to_stdout
    end
  end

  context "paddings" do
    it "returns zero-padding message" do
      expect { lumos "Imperio", position: :top }.to output("#######\nImperio\n").to_stdout
    end

    it "returns 1-digit padding message" do
      expect { lumos "Imperio", position: :top, padding: 1 }.to output("#######\n\nImperio\n").to_stdout
    end

    it "returns 2-digits padding message" do
      expect { lumos "Imperio", position: :top, padding: 2 }.to output("#######\n\n\nImperio\n").to_stdout
    end
  end

  context "delimiters" do
    it "returns delimiter message" do
      expect { lumos "Impedimenta", position: :top, delimiter: "★" }.to output("★★★★★★★★★★★\nImpedimenta\n").to_stdout
    end

    it "returns message with multichar delimiter" do
      expect { lumos "Impedimenta", position: :top, delimiter: "=->" }.to output("=->=->=->=-\nImpedimenta\n").to_stdout
    end
  end
end
