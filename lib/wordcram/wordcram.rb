$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dsl'

class Wordcram      
  extend Dsl
  
  def self.design     
    puts 'here comes the code block!' 
    hello()
    yield
    puts 'this ends the code block!'    
  end            
end