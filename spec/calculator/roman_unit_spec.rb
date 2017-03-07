require 'spec_helper'

describe Calculator::RomanUnit do

  describe "Can convern roman to numeral" do

    roman_string = 'MCMXCIX'

    context "successfully" do
      it 'should convert to 1999' do
        expect(Calculator::RomanUnit.convert_to_numeral(roman_string: roman_string)).to be 1999
      end
    end

    context "it does not provide the named parameters expected" do
      it { expect { Calculator::RomanUnit.convert_to_numeral('foo') }.to raise_error(ArgumentError) }
    end

  end

end
