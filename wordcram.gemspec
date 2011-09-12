Gem::Specification.new do |s|
  s.name        = 'wordcram'
  s.version     = '0.1.0'
  s.date        = '2011-09-13'
  s.summary     = "Create cool Word Clouds programatically"
  s.description = "A wrapper for the WordCram java library"
  s.authors     = ["Gonzalo Rodriguez-Baltanas Diaz"]
  s.email       = 'siotopo@gmail.com'
  s.files = Dir['lib/**/*.rb'] + Dir['vendor/**/*']
  s.require_paths = ["lib"]  
  s.homepage    = 'https://github.com/Nerian/s9-e1'   
  s.add_runtime_dependency 'ruby-processing'
end