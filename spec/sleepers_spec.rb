require "spec_helper"

RSpec.describe Sleepers do
  it "has a version number" do
    expect(Sleepers::VERSION).not_to be nil
  end

  describe "table print" do
    it "can print via table print" do
      expect{tp []}.not_to raise_error
    end
  end

  describe "awesome print" do
    it 'can awesome print something' do
      expect{ap Hashie::Mash.new(test: "me")}.not_to raise_error
    end
  end

  describe "PryByebug" do
    it 'is defined' do
      expect(defined? PryByebug).to eq 'constant'
    end
  end

  describe "simple_command" do
    it 'is defined' do
      expect(defined? SimpleCommand).to eq 'constant'
    end
  end

  describe 'mutations' do
    it 'is defined' do
      expect(defined? Mutations::Command).to eq 'constant'
    end
  end
end
