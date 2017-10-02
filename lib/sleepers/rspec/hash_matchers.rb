require 'rspec/expectations'

RSpec::Matchers.define :have_keys do
  match do |actual|
    @missing_keys = expected.sort - actual.keys.sort & expected.sort
    @missing_keys.none?
  end

  failure_message do
    %Q{
      Expected Hash to have all keys in:
      #{expected}

      MISSING:
      #{@missing_keys}
    }
  end
end


RSpec::Matchers.define :only_have_keys do
  match do |actual|
    exp = expected.sort
    act = actual.keys.sort
    @missing_keys = exp - act & exp
    @additional_keys = act - exp
    @missing_keys.none? && @additional_keys.none?
  end

  failure_message do
    "Expected #{actual} to only have keys #{expected}. Missing keys: #{@missing_keys}. Additional keys: #{@additional_keys}"
  end
end
