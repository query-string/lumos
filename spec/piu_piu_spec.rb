require "piu_piu"

describe PiuPiu do
  context "#piupiu_devide" do
    it "without arguments returns sharps" do
      expect(piupiu_devide).to eql("###")
    end
  end

  context "#piupiu_wrap" do
    it "without arguments returns devider" do
      expect(piupiu_wrap).to eql("###")
    end

    it "without arguments returns wrapped message" do
      expect(piupiu_wrap "Meow!").to eql("### Meow! ###")
    end
  end
end
