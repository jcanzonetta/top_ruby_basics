require './lib/caesar_shift.rb'


describe "wrap_code Upper Case" do
    it "returns 90" do
        char = 'Z'
        char = char.bytes
        expect(wrap_code(65, 90,char[0])).to eql(90)
    end
end

describe "wrap_code Lower Case" do
    it "returns 122" do
        char = 'z'
        char = char.bytes
        expect(wrap_code(97, 122, char[0])).to eql(122)
    end
end


describe "caesar_cipher wraps capital A" do
    it "returns A" do
        expect(caesar_cipher('Z', 1)).to eql("A")
    end
end

describe "caesar_cipher wraps lower case a" do
    it "returns a" do
        expect(caesar_cipher('z', 1)).to eql("a")
    end
end

describe "caesar_cipher ignores !" do
    it "Ignores punctuation, returns !" do
        expect(caesar_cipher('!', 1)).to eql("!")
    end
end

describe "caesar_cipher full" do
    it "Ignores punctuation, returns !" do
        expect(caesar_cipher(' ', 1)).to eql(" ")
    end
end

describe "caesar_cipher full" do
    it "returns Bmfy f xywnsl!" do
        expect(caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
    end
end

describe "caesar_cipher empty argument" do
    it "returns nothing" do
        expect(caesar_cipher("", 5)).to eql("")
    end
end