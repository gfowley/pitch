require 'nodejs'
puts defined?(NodeJS)
require 'yaml'

module YAML
  def self.load_file path
    load_path path
  end
end

samples = YAML.load_file "samples/osc_sine_440/0.yaml"
puts samples.count

