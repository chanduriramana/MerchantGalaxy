Dir[File.join(__dir__, 'calculator', 'concerns', '**/*.rb')].each {|file| require file }
Dir[File.join(__dir__, 'calculator', '**/*.rb')].each {|file| require file }

module Calculator

  module_function

  def process_line(line)
    case line
    when /^([a-z]+) is ([I|V|X|L|C|D|M])$/
      GalaxyUnit.set_galaxy_unit_value(galaxy_unit: $1, roman_numeral: $2)
    when /^([a-z ]+)([A-Z]\w+) is (\d+) Credits$/
      MetalUnit.set_metal_value(galaxy_units_array: $1.split, metal: $2, credits: $3)
    when /^how much is ((\w+ )+)\?$/
      result = GalaxyUnit.convert_to_numeral(galaxy_units_array: $1.split)
      puts "#{$1}is #{result} Credits"
    when /^how many Credits is ([a-z ]+)([A-Z]\w+) \?$/
      result = MetalUnit.convert_to_numeral(galaxy_units_array: $1.split, metal: $2)
      puts "#{$1}#{$2} is #{result} Credits"
    else
      puts "I have no idea what you are talking about"
    end
  end

  def read_input_file(file_name)
    File.read(file_name).each_line { |line| process_line line }
  end
end
