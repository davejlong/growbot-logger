module Growbot
  describe Logger do
    describe '.configuration' do
      it 'provides an instance of Configuration' do
        expect(Logger.configuration).to be_instance_of Logger::Configuration
      end

      it 'caches the configuration object' do
        expect(Logger.configuration).to be Logger.configuration
      end
    end

    describe '.configure' do
      it 'accepts a block' do
        expect { |block| Logger.configure(&block) }.to yield_control.once
      end

      it 'yields with an instance of configuration' do
        expect { |block| Logger.configure(&block) }
          .to yield_with_args(Logger::Configuration)
      end

      it 'preserves configuration settings' do
        Logger.configure { |config| config.arango_url = 'foo bar' }
        expect(Logger.configuration.arango_url).to eql 'foo bar'
      end
    end
  end
end
