$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dsl'
require 'placer'  

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