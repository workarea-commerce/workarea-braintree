$:.push File.expand_path("../lib", __FILE__)

require "workarea/braintree/version"

Gem::Specification.new do |s|
  s.name        = "workarea-braintree"
  s.version     = Workarea::Braintree::VERSION
  s.authors     = ["Bryan Alexander"]
  s.email       = ["balexander@weblinc.com"]
  s.homepage    = "https://github.com/workarea-commerce/workarea-braintree"
  s.summary     = "ActiveMerchant Gateway and supporting classes for BrainTree"
  s.description = "Adds ability to handle credit card storage and processing"
  s.files       = `git ls-files`.split("\n")
  s.license = 'Business Software License'

  s.required_ruby_version = ">= 2.0.0"

  s.add_dependency "workarea",  "~> 3.x"
  s.add_dependency "braintree", "~> 2.63"
end
