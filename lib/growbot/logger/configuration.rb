require 'ashikawa-core'

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

      # Attribute writer for arango_url
      # @param [String] arango_url
      def arango_url=(arango_url)
        @arango_url = arango_url
        @database = nil
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
    end
  end
end
