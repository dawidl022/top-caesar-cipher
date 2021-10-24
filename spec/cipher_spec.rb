require_relative "../lib/cipher"

describe "cipher" do

  describe "#letter?" do
    it "returns true for a lowercase ASCII letter" do
      expect(letter?("a")).to be true
    end
    it "returns true for an uppercase ASCII letter" do
      expect(letter?("Z")).to be true
    end
    it "returns true for a non-ASCII letter" do
      expect(letter?("ż")).to be true
    end
    it "returns false for a digit" do
      expect(letter?("7")).to be false
    end
    it "returns false for a whitespace" do
      expect(letter?("\n")).to be false
    end
    it "returns false for a symbol" do
      expect(letter?("$")).to be false
    end
  end

  describe "#is_upper?" do
    it "returns true for uppercase letter" do
      expect(is_upper?("D")).to be true
    end
    it "returns true for string with all letters uppercase" do
      expect(is_upper?("ABCD")).to be true
    end
    it "returns true for string with all letters uppercase and with symbols and spaces" do
      expect(is_upper?("AB? YES, CD!")).to be true
    end
    it "returns false for a lowercase letter" do
      expect(is_upper?("a")).to be false
    end
    it "returns false for a string with a lowercase letter" do
      expect(is_upper?("YES, a IS LOWERCASE!")).to be false
    end
  end

  describe "#shift" do
    it "raises ArgumentError with message is key arg if not between 0 and 25" do
      expect {shift("test", -2)} .to \
        raise_error ArgumentError, "Key must be an integer between 0 and 25"
    end
    it "shifts the letter 'a' by key 3 and returns 'd'" do
      expect(shift("a", 3)).to eql("d")
    end
    it "wraps round to the start of the alphabet when reaches its end" do
      expect(shift("X", 10)).to eql("H")
    end
    it "returns the same letter when the key is 0" do
      expect(shift("A", 0)).to eql("A")
    end
  end

  describe "#caesar_cipher" do
    it "returns a correctly ciphered message with a key between 0 and 25" do
      expect(caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
    end
    it "returns the same message if none of the characters are ASCII letters" do
      expect(caesar_cipher("?#! @", 10)).to eql("?#! @")
    end
    it "returns a correctly ciphered message with a key of over 25" do
      expect(caesar_cipher("What a string!", 57)).to eql("Bmfy f xywnsl!")
    end
    it "returns a correctly ciphered message with a negative key" do
      expect(caesar_cipher("Bmfy f xywnsl!", -5)).to eql("What a string!")
    end
  end

  describe "#main" do
    it "returns a ciphered message when given an array of two elements" do
      expect(main(["What a string!", "5"])).to eql("Bmfy f xywnsl!")
    end
    it "returns usage information if given an array of less than two elements" do
      expect(main(["Hello"])).to eql(
        "Usage: ruby cipher.rb \"<text-to-be-ciphered>\" <key-to-shift-letters>"
      )
    end
  end

end
