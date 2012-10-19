Gem::Specification.new do |s|
  s.name        = 'pangrammic_surplus'
  s.version     = '0.0.1'
  s.summary     = 'Pangrammic Surplus'
  s.description = 'Determines the surplus of characters that satisfies a self-enumerating pangram.'
  s.author      = 'Christopher Patuzzo'
  s.email       = 'chris@patuzzo.co.uk'
  s.files       = ['README.md'] + Dir['lib/**/*.*']
  s.homepage    = 'https://github.com/cpatuzzo/pangrammic_surplus'

  s.add_development_dependency 'rspec'
end
