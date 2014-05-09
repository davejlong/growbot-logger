module Growbot::Logger
  describe ArduinoReader do
    let(:config) { MockConfiguration.new }

    it 'accepts a configuration object' do
      expect { expect(ArduinoReader.new config) }.not_to raise_error
    end

    it 'saves the configuration object to an instance var' do
      arduino_reader = ArduinoReader.new config
      expect(arduino_reader.instance_variable_get('@configuration'.to_sym))
        .to be config
    end

    describe '#read' do
      
    end
  end
end
