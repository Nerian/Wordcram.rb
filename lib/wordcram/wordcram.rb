require_relative 'dsl'

# This is the main interface. The API that most users are going to use.

class Wordcram  
  include Dsl
  attr_accessor :wordcram
  
  def initialize(papplet) 
    @wordcram = Java.wordcram.WordCram.new(papplet)
    yield self if block_given?               
  end
  
  def draw_all()  
    @wordcram.draw_all()    
  end   
                                                    
end