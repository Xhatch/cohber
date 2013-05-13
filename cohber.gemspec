# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cohber/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_runtime_dependency('faraday', '~> 0.7')
  gem.add_runtime_dependency('faraday_middleware', '~> 0.8')
  gem.add_runtime_dependency('hashie',  '>= 0.4.0')
  gem.add_runtime_dependency('multi_xml', '~> 0.5.3')
  gem.add_runtime_dependency('active_support/core_ext/array/conversions')
  gem.post_install_message =<<eos
********************************************************************************

  Follow @xhatch on Twitter for announcements, updates, and news.
  https://twitter.com/xhatch

********************************************************************************
eos
  gem.name          = "cohber"
  gem.version       = "0.0.1"
  gem.authors       = ["Jason Dinsmore"]
  gem.email         = ["jason@xhatch.com"]
  gem.description   = %q{A simple (unofficial) client for the Cohber fulfillment API}
  gem.summary       = %q{A simple (unofficial) client for the Cohber fulfillment API}
  gem.homepage      = "http://xhatch.com"
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.platform = Gem::Platform::RUBY
  gem.version = Cohber::VERSION.dup
end
