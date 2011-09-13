require_relative 'modifiers'

# This is the main interface. The API that most users are going to use.

class Wordcram  
  include Modifiers
  attr_accessor :wordcram
  
  def initialize(papplet)
    @wordcram = Java.wordcram.WordCram.new(papplet)
    yield self if block_given?               
  end
  
  def draw_all()  
    wordcram.draw_all()    
  end      
  
  class Placer
    def initialize(&block)
      @block = block
    end

    def place(word, index, count, word_width, word_height, field_width, field_height)
      scene = {}
      scene[:word] = word
      scene[:word_index] = index
      scene[:words_count] = count
      scene[:word_image_width] = word_width     
      scene[:word_image_height] = word_height
      scene[:field_width] = field_width
      scene[:field_height] = field_height 
  	  
      @block.call(scene)
    end
  end                                                       
end