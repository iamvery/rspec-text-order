# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "display_order/version"

Gem::Specification.new do |spec|
  spec.name          = 'rspec-display-order'
  spec.version       = DisplayOrder::VERSION
  spec.authors       = ['Jay Hayes']
  spec.email         = ['ur@iamvery.com']

  spec.summary       = %q{An RSpec matcher that tests the display order on the page.}
  spec.description   = %q{An RSpec matcher that tests the display order on the page.}
  spec.homepage      = 'https://github.com/iamvery/rspec-display-order'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
end
