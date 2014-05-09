require 'ashikawa-core'
require 'arduino_firmata'

module Growbot
  module Logger
    # Configuration module for Growbot logger
    class Configuration
      # @!attribute [r] arango_url
      #   connection URL to Arango (ex. http://localhost:8529/_db/growbot)
      attr_reader :arango_url

      # @!attribute [rw] db_collection
      #   Collection to read data from within Arango
      attr_accessor :db_collection

      # @!attribute [rw] arduino_path
      #   Path to the Arduino serial port (example: /dev/ttyACM0)
      attr_accessor :arduino_path

      # @!attribute [r] pin_map
      #   Can either be a path to a YML file to read pin mappings from or a
      #   hash of pin mappings. See examples for how to set pin mappings
      attr_reader :pin_map

      # Attribute writer for arango_url
      # @param [String] arango_url
      def arango_url=(arango_url)
        @arango_url = arango_url
        @database = nil
      end

      # Sets the pin map. Map argument can either be a file or a hash
      # @param [Hash, String] map
      def pin_map=(map)
        if map.is_a? Hash
          @pin_map = map
        elsif map.is_a?(String) && File.exist?(map)
          @pin_map = YAML.load_file(map).reduce({}) do |memo, (key, value)|
            memo[key.to_sym] = value
            memo
          end
        else
          fail 'Map was not valid'
        end
      end

      # Database accessor
      # @return [Ashikawa::Core::Database] Instance of Arango DB
      def database
        @database ||= Ashikawa::Core::Database.new do |config|
          config.url = @arango_url
        end
      end

      # Database collection accessor
      # @return [Ashikawa::Core::Collection] Instance of Arango Collection
      def collection
        database[@db_collection]
      end

      # Use the Arduino Path to create a new instance of the ArduinoFirmata
      # class
      # @return [ArduinoFirmata::Arduino] Instace of the ArduinoFirmata object
      def firmata
        ArduinoFirmata.connect @arduino_path
      end
    end
  end
end
