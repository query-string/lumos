# encoding: utf-8
require "spec_helper"

describe Lumos::Formatters::Vertical do
  context "messages" do
    it "returns message" do
      expect { lumos "Obliviate", position: :vertical }.to output("# Obliviate #\n").to_stdout
    end

    it "returns multiline message" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", position: :vertical }.to output("# Coffee has long had a reputation as being unhealthy. But in almost eve #\n# ry single respect that reputation is backward. The potential health be #\n# nefits are surprisingly large.                                         #\n").to_stdout
    end

    it "returns multiline message with defined length" do
      expect { lumos "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", position: :vertical, length: 35 }.to output("# Coffee has long had a reputation as #\n#  being unhealthy. But in almost eve #\n# ry single respect that reputation i #\n# s backward. The potential health be #\n# nefits are surprisingly large.      #\n").to_stdout
    end
  end

  context "paddings" do
    it "returns zero-padding message" do
      expect { lumos "Oppugno", position: :vertical, padding: 0 }.to output("#Oppugno#\n").to_stdout
    end

    it "returns 1-digit padding message" do
      expect { lumos "Oppugno", position: :vertical, padding: 1 }.to output("# Oppugno #\n").to_stdout
    end

    it "returns 2-digits padding message" do
      expect { lumos "Oppugno", position: :vertical, padding: 2 }.to output("#  Oppugno  #\n").to_stdout
    end
  end

  it "returns delimiter message" do
    expect { lumos "Obscuro", position: :vertical, delimiter: "☢" }.to output("☢ Obscuro ☢\n").to_stdout
  end
end
