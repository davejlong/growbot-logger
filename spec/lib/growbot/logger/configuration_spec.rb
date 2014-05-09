module Growbot::Logger
  describe Configuration do
    subject(:config) { Configuration.new }

    it 'has Arango URL property' do
      expect(config).to respond_to :arango_url
    end

    it 'has a Collection property' do
      expect(config).to respond_to :db_collection
    end

    describe '#database' do
      it 'returns an instance of Ashikawa::Core::Database' do
        config.arango_url = 'http://127.0.0.1:8529/_db/growbot_test'
        expect(config.database).to be_instance_of Ashikawa::Core::Database
      end
    end

    describe '#collection' do
      it 'returns an instance of Ashikawa::Core::Collection' do
        config.arango_url = 'http://127.0.0.1:8529/_db/growbot_test'
        expect(config.collection).to be_instance_of Ashikawa::Core::Collection
      end
    end

    describe '#pin_map' do
      context 'with file as parameter' do
        let(:map_file) do
          map = File.dirname __FILE__
          map = File.join(map, '..', '..', '..', 'support', 'pin_mapping.yml')
          File.expand_path map
        end

        it 'sets the pin map' do
          config.pin_map = map_file
          expect(config.pin_map[:moisture]).to be_instance_of Array
          expect(config.pin_map[:light]).to be_instance_of Array
        end
      end

      context 'with hash as parameter' do
        let(:map) { { moisture: [4, 5], light: [4, 5] } }

        it 'sets the pin map' do
          config.pin_map = map
          expect(config.pin_map[:moisture]).to be_instance_of Array
          expect(config.pin_map[:light]).to be_instance_of Array
        end
      end
    end

    # Can't test this unless Arduino connected
    # describe '#firmata' do
    #   it 'returns an instance of the ArduinoFirmata library' do
    #     expect(config.firmata).to be_instance_of ArduinoFirmata::Arduino
    #   end
    # end
  end
end
