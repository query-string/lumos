require "spec_helper"

RSpec.describe "Lumos kernel extensions" do
  context "#lumos_devide" do
    it "returns sharps if no arguments defined" do
      expect { lumos_devide }.to output("###").to_stdout
    end

    it "returns delimiter based string if delimiter defined" do
      expect { lumos_devide "@" }.to output("@@@").to_stdout
    end

    it "define itarations number" do
      expect { lumos_devide "-", 10 }.to output("----------").to_stdout
    end
  end

  context "#lumos_wrap" do
    it "returns devider without any arguments" do
      expect { lumos_wrap }.to output("###").to_stdout
    end

    it "returns wrapped message if message defined" do
      expect { lumos_wrap "Aguamenti" }.to output("###########\n#Aguamenti#\n###########").to_stdout
    end
  end
end
