require "piu_piu"

describe PiuPiu do
  context "#piupiu_devide" do
    it "returns sharps without arguments" do
      expect { piupiu_devide }.to output("\"###\"\n").to_stdout
    end

    it "returns delimiter based string with delimiter argument" do
      expect { piupiu_devide "@" }.to output("\"@@@\"\n").to_stdout
    end

    it "define itarations number" do
      expect { piupiu_devide "-", 10 }.to output("\"----------\"\n").to_stdout
    end
  end

  context "#piupiu_wrap" do
    it "returns devider without arguments" do
      expect { piupiu_wrap }.to output("\"###\"\n").to_stdout
    end

    it "returns wrapped message with message argument" do
      expect { piupiu_wrap "Meow!" }.to output("\"### Meow! ###\"\n").to_stdout
    end

    it "returns wrapped message and specified delimiter" do
      expect { piupiu_wrap "Meow!", {delimiter: "@"} }.to output("\"@@@ Meow! @@@\"\n").to_stdout
    end
  end
end
