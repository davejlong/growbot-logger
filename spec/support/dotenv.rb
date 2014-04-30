require 'dotenv'

Dotenv.load

RSpec.configure do |config|
  config.before(:each) { Dotenv.overload }
end
