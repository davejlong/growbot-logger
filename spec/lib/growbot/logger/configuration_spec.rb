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

        it 'can receive a file to read pin mappings from' do
          config.pin_map = map_file

          # Check if pin_map is populated
        end

        # TODO: Test that pin map is set correctly
      end

      context 'with hash as parameter' do
        # TODO: Test that accepts a hash
        #
        # TODO: Test that sets pin map correctly
      end
    end
  end
end
