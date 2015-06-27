# encoding: utf-8
require "spec_helper"

describe Lumos::Formatters::Left do
  context "messages" do
    it "returns wrapped message" do
      expect { lumos "Engorgio", position: :left }.to output("# Engorgio\n").to_stdout
    end

    it "returns multiline message" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", position: :left }.to output("# Coffee has long had a reputation as being unhealthy. But in almost eve\n# ry single respect that reputation is backward. The potential health be\n# nefits are surprisingly large.\n").to_stdout
    end

    it "returns multiline message with defined length" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", position: :left, length: 35 }.to output("# Coffee has long had a reputation as\n#  being unhealthy. But in almost eve\n# ry single respect that reputation i\n# s backward. The potential health be\n# nefits are surprisingly large.\n").to_stdout
    end
  end

  context "paddings" do
    it "returns zero-digit padding message" do
      expect { lumos "Episkey", position: :left, padding: 0 }.to output("#Episkey\n").to_stdout
    end

    it "returns 1-digit padding message" do
      expect { lumos "Episkey", position: :left, padding: 1 }.to output("# Episkey\n").to_stdout
    end

    it "returns 2-digits padding message" do
      expect { lumos "Episkey", position: :left, padding: 2 }.to output("#  Episkey\n").to_stdout
    end
  end

  it "returns delimiter message" do
    expect { lumos "Ennervate", position: :left, delimiter: "☭" }.to output("☭ Ennervate\n").to_stdout
  end
end
