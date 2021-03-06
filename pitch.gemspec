
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pitch/version"

Gem::Specification.new do |spec|
  spec.name          = "pitch"
  spec.version       = Pitch::VERSION
  spec.authors       = ["Gerard Fowley"]
  spec.email         = ["gerard.fowley@iqeo.net"]

  spec.summary       = "Detect pitch of Web Audio API Analyser Time Domain data"
  spec.homepage      = "https://github.com/gfowley/pitch"
  spec.license       = "LGPL"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
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

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.1"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "opal", "~> 0.11.3"
  spec.add_development_dependency "opal-sprockets"
  spec.add_development_dependency "opal-rspec", "0.7.0.rc.2" # , "0.6.1"
  spec.add_development_dependency "therubyracer"

end
