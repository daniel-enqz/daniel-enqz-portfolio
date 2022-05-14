require "main"
require "csv"
require "json"

describe "#search_in_csv" do
  context "Searches in memory correctly" do
    let(:search) { search_in_csv(7, File.dirname(__FILE__) + "/../lib/stored_sequences.csv") }

    it "should return a parsed array or sequence if record found in memory" do
      target = [7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
      expect(search).to eq target
    end

    let(:sequence) { search_in_csv(-99, File.dirname(__FILE__) + "/../lib/stored_sequences.csv") }

    it "should return 0 if record is not found in memory" do
      target = 0
      expect(sequence).to eq target
    end
  end
end

describe "#create_record" do
  context "Returns the right collatz conjecture sequence when an input is given and stores in memory correctly" do
    let(:collatz_conjecture) { create_record(100, File.dirname(__FILE__) + "/../lib/stored_sequences.csv") }

    it "should return the right collatz conjecture" do
      target = [100, 50, 25, 76, 38, 19, 58, 29, 88, 44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
      expect(collatz_conjecture.sequence).to eq target
    end

    it "should return the correct number of steps taken" do
      target = 25
      expect(collatz_conjecture.steps).to eq target
    end
  end
end
