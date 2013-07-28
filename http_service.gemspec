$:.push File.expand_path('../lib', __FILE__)
require 'http_service/version'

Gem::Specification.new do |s|
  s.name          = 'http_service'
  s.summary       = 'HTTP Fetcher Gem based on Faraday'
  s.description   = "Used in some of New Republic Brewing's gems"

  s.homepage          = 'https://github.com/NewRepublicBrewing/http-service'
  s.rubyforge_project = 'http_service'

  s.add_dependency 'faraday', '~> 0.0'
  s.add_dependency 'faraday_middleware-parse_oj', '~> 0.0'
  s.add_dependency 'hashie', '~> 1.0'

  s.add_development_dependency 'guard-rspec', '~> 2.0'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 2.0'
  s.add_development_dependency 'rb-inotify', '~> 0.0' # Filesystem watcher for Guard on Linux

  s.authors       = ['Dean Brundage']
  s.email         = ['dean@newrepublicbrewing.com']

  s.files         = [
                      'LICENSE',
                      'README.md',
                      'lib/http_service.rb',
                      'lib/http_service/response.rb',
                      'lib/http_service/version.rb'
                    ]
  s.test_files    = [ 
                      'spec/cases/http_service_spec.rb',
                      'spec/cases/http_service/response_spec.rb',
                      'spec/cases/version_spec.rb',
                      'spec/spec_helper.rb'
                    ]
  s.require_paths = ['lib']

  s.platform      = Gem::Platform::RUBY
  s.version       = NRB::HTTPService.version
end
