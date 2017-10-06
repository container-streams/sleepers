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
