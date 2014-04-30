require 'ashikawa-core'

RSpec.configure do |config|
  config.before(:suite) do
    # Ensure that the database exists
    begin
      connection = Ashikawa::Core::Connection.new(ENV['url'])
      connection.send_request '/_api/database', post: {
        name: ENV['database'], username: ENV['username']
      }
    rescue StandardError
    end
  end
end
