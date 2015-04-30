require "spec_helper"

RSpec.describe "PiuPiu kernel extensions" do
  context "#piupiu_devide" do
    it "returns sharps if no arguments defined" do
      expect { piupiu_devide }.to output("###").to_stdout
    end

    it "returns delimiter based string if delimiter defined" do
      expect { piupiu_devide "@" }.to output("@@@").to_stdout
    end

    it "define itarations number" do
      expect { piupiu_devide "-", 10 }.to output("----------").to_stdout
    end
  end

  context "#piupiu_wrap" do
    it "returns devider without any arguments" do
      expect { piupiu_wrap }.to output("###").to_stdout
    end

    it "returns wrapped message if message defined" do
      expect { piupiu_wrap "Aguamenti" }.to output("###########\n#Aguamenti#\n###########").to_stdout
    end
  end
end
