require 'spec_helper'

describe Calculator::MetalUnit do

  before do |test|
    Calculator::GalaxyUnit.set_galaxy_unit_value(galaxy_unit: 'glob', roman_numeral: 'I')
    Calculator::GalaxyUnit.set_galaxy_unit_value(galaxy_unit: 'prok', roman_numeral: 'V')
    Calculator::GalaxyUnit.set_galaxy_unit_value(galaxy_unit: 'pish', roman_numeral: 'X')
  end

  describe "#set_metal_value" do

    subject (:set_metal_value) { Calculator::MetalUnit.set_metal_value(galaxy_units_array: ['glob', 'prok'], metal: 'Gold', credits: 57800) }

    context "given three parameters :galaxy_units_array, :metal and :credits " do
      it do
        set_metal_value
        metal_value = 57800 / Calculator::GalaxyUnit.convert_to_numeral(galaxy_units_array: ['glob', 'prok']).to_f
        expect(Calculator::MetalUnit.get_metal_value('Gold')).to eq(metal_value)
      end
    end

    context "when it does not provide the named parameters expected" do
      it { expect { Calculator::MetalUnit.set_metal_value('foo') }.to raise_error(ArgumentError) }
    end

  end

  describe "#convert_to_numeral" do

    let(:set_metal_value) { Calculator::MetalUnit.set_metal_value(galaxy_units_array: ['pish', 'pish'], metal: 'Iron', credits: 3910) }

    context "given two parameters :galaxy_units_array and :metal'" do
      it do
        set_metal_value
        expect(Calculator::MetalUnit.convert_to_numeral(galaxy_units_array: ['glob', 'prok'], metal: 'Iron')).to be 782
      end
    end

    context "when it does not provide the named parameters expected" do
      it { expect { Calculator::MetalUnit.convert_to_numeral('foo') }.to raise_error(ArgumentError) }
    end

  end


end
