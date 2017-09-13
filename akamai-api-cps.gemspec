# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'akamai/api/cps/version'

Gem::Specification.new do |spec|
  spec.name          = 'akamai-api-cps'
  spec.version       = Akamai::API::CPS::VERSION
  spec.authors       = ['Rajiv Aaron Manglani']
  spec.email         = ['rmanglan@akamai.com']

  spec.summary       = %q{A ruby library which wraps the Akamai CPS API.}
  spec.homepage      = 'https://github.com/rajiv/akamai-api-cps'
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'akamai-edgegrid', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
