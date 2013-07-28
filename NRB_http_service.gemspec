$:.push File.expand_path('../lib', __FILE__)
require 'NRB_http_service/version'

Gem::Specification.new do |s|
  s.name          = 'NRB_http_service'
  s.summary       = 'HTTP Fetcher Gem based on Faraday'
  s.description   = "Used in some of New Republic Brewing's gems"

  s.homepage          = 'https://github.com/NewRepublicBrewing/http-service'
  s.rubyforge_project = 'NRB_http_service'

  s.add_dependency 'faraday', '~> 0.0'

  s.add_development_dependency 'guard-rspec', '~> 2.0'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 2.0'
  s.add_development_dependency 'rb-inotify', '~> 0.0' # Filesystem watcher for Guard on Linux

  s.authors       = ['Dean Brundage']
  s.email         = ['dean@newrepublicbrewing.com']

  s.files         = [
                      'LICENSE',
                      'README.md',
                      'lib/NRB_http_service.rb',
                      'lib/NRB_http_service/response.rb',
                      'lib/NRB_http_service/version.rb'
                    ]
  s.test_files    = [ 
                      'spec/cases/NRB_http_service_spec.rb',
                      'spec/cases/NRB_http_service/response_spec.rb',
                      'spec/cases/version_spec.rb',
                      'spec/spec_helper.rb'
                    ]
  s.require_paths = ['lib']

  s.platform      = Gem::Platform::RUBY
  s.version       = NRB::HTTPService.version
end
