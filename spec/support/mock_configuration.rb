module Growbot::Logger
  # Mock of Growbot::Logger::Configuration
  class MockConfiguration
    def firmata
      MockArduinoFirmata::Arduino.new
    end
  end
end
