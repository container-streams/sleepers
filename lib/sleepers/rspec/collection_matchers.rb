require 'rspec/expectations'

RSpec::Matchers.define :each_be do
  match do |object|
    @object = object
    object.all?{|item| item.send("#{expected}?")}
  end

  failure_message do
    "expected collection to all be '#{expected || "nil"}'"
  end
end

RSpec::Matchers.define :each_not_be do
  match do |object|
    object.none?{|item| item.send("#{expected}?")}
  end
end

RSpec::Matchers.define :each_eq do
  match do |actual|
    actual.all?{|item| item == expected}
  end
end

RSpec::Matchers.define :each_be_kind_of do
  match do |actual|
    actual.all?{|item| item.kind_of?(expected)}
  end
end

RSpec::Matchers.define :each_respond_to do
  match do |actual|
    actual.all?{|item| item.respond_to? expected}
  end
end

RSpec::Matchers.define :each_match do
  match do |actual|
    actual.all?{|item| item.match(expected).nil?}
  end
end

RSpec::Matchers.define :have_count_of do
  match do |actual|
    actual.count == expected
  end

  failure_message do
    "expected collection to have count of #{expected}, got #{actual.count}"
  end
end

RSpec::Matchers.define :each_have_key do
  match do |actual|
    actual.all?{|item| item.keys.include? expected }
  end
end

RSpec::Matchers.define :each_have_keys do
  match do |actual|
    @unmatched = actual.select{|item| item.keys.sort & expected.sort != expected.sort}
    @missing_keys = @unmatched.map { |item| expected - (item.keys.sort & expected.sort) }.uniq.flatten
    @unmatched.empty?
  end

  failure_message do
    "Expected collection to each have keys #{expected.sort}. The following keys were missing from one or more items #{@missing_keys} "
  end
end

RSpec::Matchers.define :each_only_have_keys do
  match do |actual|
    actual.all?{|item| item.keys.sort == expected.sort}
  end
end

RSpec::Matchers.define :have_ids_matching do
  match do |actual|
    actual.collect{|item| (item['id'] || item[:id]) }.sort == expected.collect(&:id).sort
  end
end

RSpec::Matchers.define :not_have_ids_matching do
  match do |actual|
    (actual.collect{|item| (item['id'] || item[:id]) } & expected.collect(&:id)).empty?
  end
end
