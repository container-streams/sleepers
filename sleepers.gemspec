# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sleepers/version'

Gem::Specification.new do |spec|
  spec.name          = "sleepers"
  spec.version       = Sleepers::VERSION
  spec.authors       = ["Tyrone Wilson"]
  spec.email         = ["tyrone.wilson@blackswan.com"]

  spec.summary       = %q{Base gems which we use in all of our rails based micro-services}
  spec.description   = %q{If you are tired of boilerplate and would like a selection of awesome gems by default then just include this gem and have a bunch of hand picked great pattern encouraging gems installed}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 11.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "gem-release"
end
