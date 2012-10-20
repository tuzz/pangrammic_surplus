Gem::Specification.new do |s|
  s.name        = 'pangrammic_surplus'
  s.version     = '1.0.0'
  s.summary     = 'Pangrammic Surplus'
  s.description = 'Determines the surplus of characters that satisfies a self-enumerating pangram.'
  s.author      = 'Christopher Patuzzo'
  s.email       = 'chris@patuzzo.co.uk'
  s.files       = ['README.md'] + Dir['lib/**/*.*']
  s.homepage    = 'https://github.com/cpatuzzo/pangrammic_surplus'

  s.add_dependency 'numbers_and_words'
  s.add_development_dependency 'rspec'
end
