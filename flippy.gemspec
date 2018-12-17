# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flippy/version'

Gem::Specification.new do |gem|
  gem.name          = "flippy"
  gem.version       = Flippy::VERSION
  gem.authors       = ["kyoendo"]
  gem.email         = ["postagie@gmail.com"]
  gem.description   = %q{Fippy makes a text upside down, like "twitter" to "ɹəʇʇᴉʍʇ".}
  gem.summary       = %q{Fippy makes a text upside down, like "twitter" to "ɹəʇʇᴉʍʇ".}
  gem.homepage      = "https://github.com/melborne/flippy"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.required_ruby_version = '>=1.9.3'
  gem.add_dependency 'optimist'
  gem.add_dependency 'ruby-termios'
  gem.add_development_dependency 'rspec'
end
