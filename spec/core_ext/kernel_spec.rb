require "spec_helper"
require "set"

RSpec.describe "Lumos kernel extensions" do
  context "divider" do
    it "returns sharps if no arguments defined" do
      expect { lumos }.to output("###").to_stdout
    end

    it "returns sharps if only pointer defined" do
      expect { lumos :> }.to output("###").to_stdout
    end

    it "returns delimiter based string" do
      expect { lumos :>, "-" }.to output("---").to_stdout
    end

    it "returns delimiter based string repeated 10 times" do
      expect { lumos :>, "@", 10 }.to output("@@@@@@@@@@").to_stdout
    end
  end

  context "wrapper" do
    it "returns wrapped messages if no arguments except message defined" do
      expect { lumos "Accio" }.to output("#########\n#       #\n# Accio #\n#       #\n#########").to_stdout
    end

    it "returns bottom positioned message" do
      expect { lumos "Accio", {position: :bottom, delimiter: "@"} }.to output("Accio\n@@@@@").to_stdout
    end
  end

  context "objects" do
    it "returns wra pped Array" do
      expect { lumos %w(One Two Freddy is coming for you Three Four better lock your door ) }.to output("##########################################################################\n#                                                                        #\n# [\"One\", \"Two\", \"Freddy\", \"is\", \"coming\", \"for\", \"you\", \"Three\", \"Four\" #\n# , \"better\", \"lock\", \"your\", \"door\"]                                    #\n#                                                                        #\n##########################################################################").to_stdout
    end

    it "returns wrapped Hash" do
      domains = {ru: "Russia", th: "Thailand", "com.au" => "Australia", ph: "Philippines"}
      expect { lumos domains, {length: 56}}.to output("############################################################\n#                                                          #\n# {:ru=>\"Russia\", :th=>\"Thailand\", \"com.au\"=>\"Australia\",  #\n# :ph=>\"Philippines\"}                                      #\n#                                                          #\n############################################################").to_stdout
    end

    it "returns wrapped Set" do
      expect { lumos Set.new([1,2,3])}.to output("#<Set: {1, 2, 3}>").to_stdout
    end

    it "returns wrapped Struct" do
      Struct.new("Customer", :name, :address)
      expect { lumos Struct::Customer.new("Dave", "123 Main")}.to output("##############################################################\n#                                                            #\n# #<struct Struct::Customer name=\"Dave\", address=\"123 Main\"> #\n#                                                            #\n##############################################################").to_stdout
    end

    it "returns wrapped OpenStruct" do
      Struct.new("Customer", :name, :address)
      expect { lumos OpenStruct.new(country: "Russia", population: 143_975_923)}.to output("########################################################\n#                                                      #\n# #<OpenStruct country=\"Russia\", population=143975923> #\n#                                                      #\n########################################################").to_stdout
    end
  end
end
