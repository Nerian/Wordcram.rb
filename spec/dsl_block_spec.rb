$LOAD_PATH.unshift(File.dirname(__FILE__))       

require '../lib/wordcram'   
                           
Processing::App::SKETCH_PATH = '.'
class Sketch < Processing::App
  
  def setup    
    size 650, 650               
    
    Wordcram.new(self) do |options|
      options.from(:text_string =>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
      #options.with_color(color(255, 0, 0))
      #options.with_colors(color(255, 0, 0), color(0, 255, 0)) 
      #options.with_fonts("LiberationSans")
     
      #options.sized_by_weight({:mix => 30, :max => 35})
      #options.sized_by_rank({:mix => 30, :max => 35})
      #options.with_word_padding(10)
      #options.angled_at(70)
      #options.angled_between(70, 90)
      #options.case(:upper)
      #options.case(:lower)
      #options.case(:default) 
      #options.with_placer() do |scene|  
      #  word = scene[:word]
      #  field_width = scene[:field_width] 
      #  field_height = scene[:field_height]
      #  word_width = scene[:word_image_width]
      #  word_height = scene[:word_image_height] 
        
      #  x = word.weight * (field_width - word_width)
      #  y = word.weight * (field_height - word_height)
              
      #  PVector.new(x,y)        
      #end
      
      #options.with_placer(:horizontal_line)
      #options.with_placer(:center_clump)
      #options.with_placer(:horiz_band_anchored_left)
      #options.with_placer(:swirl)
      #options.with_placer(:upper_left)
      #options.with_placer(:wave)
      #options.with_placer(your_own_placer)             
      
      options.draw_all()      
    end
  end
  
  def draw
    
  end
  
end     

Sketch.new