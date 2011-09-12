$LOAD_PATH.unshift(File.dirname(__FILE__))       

require '../lib/wordcram'   
                           
Processing::App::SKETCH_PATH = '.'
class Sketch < Processing::App
  
  def setup    
    size 350, 350
    
    Wordcram.new(self) do |options|
      options.from(:text_string =>"This is a wicked wordcram test, some words should be doubled doubled be be")
      #options.with_color(color(255, 0, 0))
      options.with_colors(color(255, 0, 0), color(0, 255, 0)) 
      options.draw_all()
      
    end
  end
  
  def draw
    
  end
  
end     

Sketch.new