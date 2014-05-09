require_relative "logger/version"
require 'ashikawa-core'
require 'arduino_firmata'

module Growbot
  module Logger
    def self.read(pin_map, arduino_path='/dev/ttyACM0', arango_url='http://localhost:8529/_db/growbot', arango_collection='readings')
      # Load the pins to read from the map file
      pin_map = YAML.load_file pin_map

      # Connect to Arduino and Arango (Ashikawa)
      arduino = ArduinoFirmata.connect arduino_path
      database = Ashikawa::Core::Database.new do |config|
        config.url = arango_url
      end

      # Take the readings
      readings = {}
      pin_map.each do |key, value|
        if value.is_a? Array
          readings[key] = value.inject(0.0) { |sum, n| sum += arduino.analog_read n }.to_f / value.length
        else
          readings[key] = arduino.analog_read value
        end
      end

      # Add the readings to the database
      database[arango_collection].create_document readings
    end
  end
end
