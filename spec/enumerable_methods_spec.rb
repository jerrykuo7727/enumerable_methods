require 'enumerable_methods'

describe "Enumerable" do
  let(:arr) { [2, 4, 6] }
  let(:hash) { {wow: 'cool', waw: 2} }

  describe "#my_each" do
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

  describe "#my_each_with_index" do
    context "given [2,4,6]" do
      it "sums up to 12" do
        sum = 0
        arr.my_each_with_index { |e| sum += e }
        expect(sum).to eql(12)
      end
      it "multiples up to 48" do
        multiplication = 1
        arr.my_each_with_index { |e| multiplication *= e }
        expect(multiplication).to eql(48)
      end
      it "returns [0,1,2] as indices" do
        indices = []
        arr.my_each_with_index { |e, i| indices << i }
        expect(indices).to eql([0, 1, 2])
      end
    end

    context "given {wow: 'cool', waw: 2}" do
      it "collect k/v pairs and indices as {[:wow,'cool']=>0,[:waw,2]=>1}" do
        kv_indices = {}
        hash.my_each_with_index do |kv, i|
          kv_indices[kv] = i
        end
        expect(kv_indices).to eql({[:wow,'cool']=>0,[:waw,2]=>1})
      end
    end
  end

  describe "#my_select" do
    context "given [2,4,6]" do
      it "return [4,6] selecting number > 3" do
        expect(arr.my_select { |e| e > 3 }).to eql([4, 6])
      end
    end

    context "given {wow: 'cool', waw: 2}" do
      it "returns ':waw' selecting values being Fixnum" do
        expect(hash.my_select { |k, v| v.is_a?(Fixnum) }).to eql([[:waw, 2]])
      end
    end
  end

end