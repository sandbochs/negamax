require 'yaml'
require './GameState'
hash = YAML.load_file('node_values.yml')
puts hash.inspect