require 'enumerable_methods'

describe "Enumerable" do

  describe "#my_each" do
    let(:arr) { [2, 4, 6] }
    let(:hash) { {wow: 'cool', waw: 2} }

    context "given [2,4,6]" do
      it "sums up to 12" do
        sum = 0
        arr.my_each { |e| sum += e }
        expect(sum).to eql(12)
      end
      it "multiples up to 48" do
        multiplication = 1
        arr.my_each { |e| multiplication *= e }
        expect(multiplication).to eql(48)
      end
    end

    context "given {wow: 'cool', waw: 2}" do
      it "collect keys and values as [:wow, :waw] and ['cool', 2]" do
        keys = []
        values = []
        hash.my_each do |key, value|
          keys << key
          values << value
        end
        expect(keys).to eql([:wow, :waw])
        expect(values).to eql(['cool', 2])
      end
    end

  end
end