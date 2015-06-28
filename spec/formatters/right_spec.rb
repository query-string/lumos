# encoding: utf-8
require "spec_helper"

describe Lumos::Formatters::Right do
  context "messages" do
    it "returns wrapped message" do
      expect { lumos "Ferula", position: :right }.to output("Ferula #\n").to_stdout
    end

    it "returns multiline message" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", position: :right }.to output("Coffee has long had a reputation as being unhealthy. But in almost eve #\nry single respect that reputation is backward. The potential health be #\nnefits are surprisingly large.                                         #\n").to_stdout
    end

    it "returns multiline message with defined length" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", position: :right, length: 35 }.to output("Coffee has long had a reputation as #\n being unhealthy. But in almost eve #\nry single respect that reputation i #\ns backward. The potential health be #\nnefits are surprisingly large.      #\n").to_stdout
    end
  end

  context "paddings" do
    it "returns zero-padding message" do
      expect { lumos "Finite Incantatum", position: :right, padding: 0 }.to output("Finite Incantatum#\n").to_stdout
    end

    it "returns 1-digit padding message" do
      expect { lumos "Finite Incantatum", position: :right, padding: 1 }.to output("Finite Incantatum #\n").to_stdout
    end

    it "returns 2-digits padding message" do
      expect { lumos "Finite Incantatum", position: :right, padding: 2 }.to output("Finite Incantatum  #\n").to_stdout
    end
  end

  it "returns delimiter message" do
    expect { lumos "Fidelius", position: :right, delimiter: "->" }.to output("Fidelius ->\n").to_stdout
  end

end
