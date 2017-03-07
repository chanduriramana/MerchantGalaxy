module Calculator
  class MetalUnit

    @metals_values ||= {} # e.g: {"Silver"=>17.0, "Gold"=>14450.0, "Iron"=>195.5}

    def self.get_metal_value(metal)
      @metals_values[metal]
    end

    # Calculates the metal's value
    def self.set_metal_value(galaxy_units_array: required, metal: required, credits: required)
      numeral = GalaxyUnit.convert_to_numeral(galaxy_units_array: galaxy_units_array)
      @metals_values[metal] = credits.to_i / numeral.to_f
    end

    def self.convert_to_numeral(galaxy_units_array: required , metal: required)
      (GalaxyUnit.convert_to_numeral(galaxy_units_array: galaxy_units_array) * get_metal_value(metal)).to_i
    end

  end
end
