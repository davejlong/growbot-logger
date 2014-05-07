require_relative './logger/version'
require_relative './logger/configuration'
require_relative './logger/arduino_reader'

# Home gardening with Raspberry Pi, Arduino and RUBY!
module Growbot
  # Growbot data logger to track grow analytics
  module Logger
    # Configures the library
    # @yield [configuration] Gives the libraries configuration object
    def self.configure(&block)
      block.call(configuration)
    end

    # Accessor for configuration instance
    # @return Configuration instance for library
    def self.configuration
      @configuration ||= Configuration.new
    end
  end
end
