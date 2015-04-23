require "piu_piu"

describe PiuPiu do
  context "#piupiu_devide" do
    it "without arguments returns sharps" do
      expect { piupiu_devide }.to output("\"###\"\n").to_stdout
    end
    it "with devider argument returns devider based string" do
      expect { piupiu_devide "@" }.to output("\"@@@\"\n").to_stdout
    end
  end

  context "#piupiu_wrap" do
    it "without arguments returns devider" do
      expect { piupiu_wrap }.to output("\"###\"\n").to_stdout
    end

    it "without arguments returns wrapped message" do
      expect { piupiu_wrap "Meow!" }.to output("\"### Meow! ###\"\n").to_stdout
    end
  end
end
