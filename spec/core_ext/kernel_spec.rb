require "spec_helper"

RSpec.describe "Lumos kernel extensions" do

  context "wrapper" do
    it "returns wrapped messages if second param is hash" do
      expect { lumos "Accio" }.to output("#########\n#       #\n# Accio #\n#       #\n#########").to_stdout
    end

    it "returns bottom positioned message" do
      expect { lumos "Accio", {position: :bottom, delimiter: "@"} }.to output("Accio\n@@@@@").to_stdout
    end
  end

  context "devider" do
    it "returns sharps if no arguments defined" do
      expect { lumos }.to output("###").to_stdout
    end

    it "returns delimiter based string repeated 10 times" do
      expect { lumos "@", 10 }.to output("@@@@@@@@@@").to_stdout
    end
  end

end
