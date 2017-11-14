require 'simplecov'

require "simplecov"


if defined?(Rails)
  SimpleCov.start :rails do
    add_filter 'spec/support/matchers'
    add_filter 'spec/support/helpers.rb'
    add_filter 'app/swagger'
    add_filter 'spec/spec_helper.rb'
    add_filter 'spec/rails_helper.rb'
  end
else
  SimpleCov.start
end

RSpec.configure do |config|
  config.around(:each, :debug, type: :model) do |example|
    @debug = true
    example.run

    if defined?(serializer)
      puts "serializer.as_json =>"
      ap serializer.as_json
    end

    puts "#"*50
    puts "SUBJECT OBJECT"
    puts "#"*50
    ap subject

    @debug = false
  end
  config.around(:each, :debug, type: :controller) do |example|
    example.run
    puts "Response body =>"
    begin
      ap json_body
    rescue JSON::ParserError => e
      puts response.body
    end
  end
end
