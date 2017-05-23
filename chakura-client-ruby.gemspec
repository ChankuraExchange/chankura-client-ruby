$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'chankura_api/client/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'chankura_client'
  s.version     = ChankuraAPI::Client::VERSION
  s.authors     = ['Chankura Exchange']
  s.email       = ['support@chankura.com']
  s.homepage    = 'https://github.com/ChankuraExchange/chankura-client-ruby'
  s.summary     = "A ruby client to access Chankura Exchange's API."
  s.description = "A ruby client which can access all Chankura Exchange's API."
  s.license     = 'MIT'

  s.require_paths = ['lib']
  s.files         = Dir['{bin,lib}/**/*'] + ['README.md']

  s.add_runtime_dependency 'faye-websocket', '~> 0.9.2'
  s.add_development_dependency 'minitest', '~> 5.5.1'
end
