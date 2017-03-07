  require 'spec_helper'

describe Calculator::GalaxyUnit do

  describe "#set_galaxy_unit_value" do

    set_galaxy_unit = Calculator::GalaxyUnit.set_galaxy_unit_value(galaxy_unit: 'glob', roman_numeral: 'I')

    context "successfully" do
      it do
        set_galaxy_unit
        expect(Calculator::GalaxyUnit.get_galaxy_values('glob')).to eq('I')
      end
    end

    context "when it does not provide the named parameters expected" do
      it { expect { Calculator::GalaxyUnit.set_galaxy_unit_value('foo') }.to raise_error(ArgumentError) }
    end

  end

  describe "#convert_to_numeral" do

    let(:set_galaxy_units) do
      Calculator::GalaxyUnit.set_galaxy_unit_value(galaxy_unit: 'glob', roman_numeral: 'I')
      Calculator::GalaxyUnit.set_galaxy_unit_value(galaxy_unit: 'prok', roman_numeral: 'V')
    end

    context "successfully" do
      it do
        set_galaxy_units
        expect(Calculator::GalaxyUnit.convert_to_numeral(galaxy_units_array: ['glob', 'prok'])).to be 4
      end
    end

    context "when it does not provide the named parameters expected" do
      it { expect { Calculator::GalaxyUnit.convert_to_numeral('foo') }.to raise_error(ArgumentError) }
    end

  end

end
