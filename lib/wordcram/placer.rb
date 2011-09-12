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


class Wordcram  
     
  def horizontal_line
    Java.wordcram.Placers.horiz_line
  end
   
  def center_clump
    Java.wordcram.Placers.center_clump
  end    
  
  def horiz_band_anchored_left
    Java.wordcram.Placers.horiz_band_anchored_left
  end                 
  
  def swirl
    Java.wordcram.Placers.swirl
  end
  
  def upper_left
    Java.wordcram.Placers.upper_left
  end                                
  
  def wave
    Java.wordcram.Placers.wave
  end    
  
  def create_placer(name)
    placer = ''
    case name
      when :horizontal_line
        placer = horizontal_line
      when :center_clump
        placer = center_clump
      when :horiz_band_anchored_left
        placer = horiz_band_anchored_left
      when :swirl
        placer = swirl
      when :upper_left
        placer = upper_left
      when :wave
        placer = wave    
    end                    
    placer
  end         
  
  def with_placer(placer=nil, &block)      
    case placer
      when Symbol
        placer = create_placer(placer)
      when placer.nil?
        placer = Placer.new &block 
    end
    @wordcram.with_placer(placer)
  end
  
end