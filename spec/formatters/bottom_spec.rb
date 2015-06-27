# encoding: utf-8
require "spec_helper"

describe Lumos::Formatters::Bottom do
  context "messages" do
    it "returns wrapped message" do
      expect { lumos "Langlock", position: :bottom }.to output("Langlock\n########\n").to_stdout
    end

    it "returns multiline message" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", position: :bottom }.to output("Coffee has long had a reputation as being unhealthy. But in almost eve\nry single respect that reputation is backward. The potential health be\nnefits are surprisingly large.\n######################################################################\n").to_stdout
    end

    it "returns multiline message with defined length" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", position: :bottom, length: 35 }.to output("Coffee has long had a reputation as\n being unhealthy. But in almost eve\nry single respect that reputation i\ns backward. The potential health be\nnefits are surprisingly large.\n###################################\n").to_stdout
    end
  end

  context "paddings" do
    it "returns zero-padding message" do
      expect { lumos "Langlock", position: :bottom, padding: 0 }.to output("Langlock\n########\n").to_stdout
    end

    it "returns 1-digit padding message" do
      expect { lumos "Langlock", position: :bottom, padding: 1 }.to output("Langlock\n\n########\n").to_stdout
    end

    it "returns 2-digits padding message" do
      expect { lumos "Langlock", position: :bottom, padding: 2 }.to output("Langlock\n\n\n########\n").to_stdout
    end
  end

  context "delimiters" do
    it "returns delimiter message" do
      expect { lumos "Legilimens", position: :bottom, delimiter: "☯" }.to output("Legilimens\n☯☯☯☯☯☯☯☯☯☯\n").to_stdout
    end

    it "returns message with multichar delimiter" do
      expect { lumos "Legilimens", position: :bottom, delimiter: "=->" }.to output("Legilimens\n=->=->=->=\n").to_stdout
    end
  end
end
