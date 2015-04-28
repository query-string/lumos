require "spec_helper"

RSpec.describe "PiuPiu kernel extensions" do
  context "#piupiu_devide" do
    it "returns sharps if no arguments defined" do
      expect { piupiu_devide }.to output("\"###\"\n").to_stdout
    end

    it "returns delimiter based string if delimiter defined" do
      expect { piupiu_devide "@" }.to output("\"@@@\"\n").to_stdout
    end

    it "define itarations number" do
      expect { piupiu_devide "-", 10 }.to output("\"----------\"\n").to_stdout
    end
  end

  context "#piupiu_wrap" do
    it "returns devider without any arguments" do
      expect { piupiu_wrap }.to output("\"###\"\n").to_stdout
    end

    it "returns wrapped message if message defined" do
      expect { piupiu_wrap "Meow!" }.to output("\"# Meow! #\"\n").to_stdout
    end

    it "returns deliminter wrapped message if delimiter defined" do
      expect { piupiu_wrap "Meow!", {delimiter: "@"} }.to output("\"@ Meow! @\"\n").to_stdout
    end

    it "returns message and delimiter aligned to left if left position defined" do
      expect { piupiu_wrap "Meow!", {delimiter: ":P", position: :left} }.to output("\":P Meow!\"\n").to_stdout
    end

    it "returns message and delimiter aligned to left if right position defined" do
      expect { piupiu_wrap "Meow!", {delimiter: ">>>", position: :right} }.to output("\"Meow! >>>\"\n").to_stdout
    end

    it "returns exception if positioning is wrong" do
      expect { piupiu_wrap "Meow!", {delimiter: "@", position: :unknown} }.to raise_error(ArgumentError)
    end
  end
end
