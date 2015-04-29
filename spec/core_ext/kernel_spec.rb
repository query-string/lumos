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
      expect { piupiu_wrap "Aguamenti" }.to output("\"# Aguamenti #\"\n").to_stdout
    end

    it "returns deliminter wrapped message if delimiter defined" do
      expect { piupiu_wrap "Alohomora", {delimiter: "@"} }.to output("\"@ Alohomora @\"\n").to_stdout
    end

    it "returns message and delimiter aligned to left if left position defined" do
      expect { piupiu_wrap "Anapneo", {delimiter: ":P", position: :left} }.to output("\":P Anapneo\"\n").to_stdout
    end

    it "returns message and delimiter aligned to left if right position defined" do
      expect { piupiu_wrap "Aparecium", {delimiter: ">>>", position: :right} }.to output("\"Aparecium >>>\"\n").to_stdout
    end

    it "returns exception if positioning is wrong" do
      expect { piupiu_wrap "Avada Kedavra", {delimiter: "@", position: :unknown} }.to raise_error(ArgumentError)
    end
  end
end
