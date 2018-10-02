#! /usr/bin/env opal

require 'nodejs'
require 'json'

samples = JSON.parse File.read("samples/osc_sine_440/0.json")
puts samples.count

