# Integration Exercise: Java Library Wrapper

_written by Shane Emmons for Mendicant University core skills session #9_

The world is full of Java. Chances are pretty good if you walk into a
corporate IT department you'll find Java. So, what do we as Ruby developers do
when forced to work with Java? We turn to JRuby and it's Java integration. Your
assignment, should you choose to accept it, is to use JRuby to wrap an existing
Java library into a new Ruby gem. You can choose any Java library you like.
However, if there already existing a functional and active gem, you should look
at wrapping a different library unless you plan on taking a different route.
Either way, please have Greg or Shane approve your chosen library before
starting work in earnest. 

Oh, and one more thing. We don't just want this to be
a straight API copy of the existing library. Abstract things away from the
programmer so that working with your gem is easier than working directly with
the library via JRuby. The code below is an example of what *not* to do.

```ruby
session   = CrystalEnterprise.getSessionManager.logon(user, password, cms, authtype)
infostore = session.getService('', 'InfoStore')
```

With a little bit of effort, this interaction could be made to feel a lot more
natural to a native Rubyist. The code shown below is much closer to what you
should be aiming for.

```ruby
session   = Enterprise.connect(user: "shane", password: "password")
infostore = session.infostore
```
For a more complete example, see Shane's [bosdk wrapper](https://github.com/semmons99/bosdk).

## Exercise Summary

- You should create a gem using JRuby that wraps an existing Java library.
- Your gem should work with a Java library that doesn't already have
  a good wrapper.
- You should make the API for your library look and feel like Ruby, not Java.


# Wordcram wrapper          

http://wordcram.org/ 

Create awesome word clouds!              
                                       
<img width='700px' src='http://wordcram.files.wordpress.com/2011/03/wordcram-4th-copy.png'></img>



## What works right now
       
``` ruby       

require 'wordcram'   
                           
Processing::App::SKETCH_PATH = '.'
class Sketch < Processing::App
  
  def setup    
    size 350, 350
    
    Wordcram.new(self) do |options|    

		# Just one one these. It is planned to be able to set many sources in the future.
		options.from(:web_url => 'http://en.wikipedia.org/wiki/Portable_Document_Format')    
		options.from(:html_string => '<html>...</html>')
		options.from(:html_file => 'html_page.html')
		options.from(:text_string => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit')    
		options.from(:text_file => 'text_file.txt')
				
		options.draw_all
    end
  end  
end     

Sketch.new       

```
                

## Planned DSL
   
``` ruby
require 'wordcram'  

myplacer = WordCram.placer do |scene| 
	scene[:word]
    scene[:wordIndex] 
    scene[:wordsCount] 
    scene[:wordImageWidth]      
    scene[:wordImageHeight] 
    scene[:fieldWidth] 
    scene[:fieldHeight] 
       
    word = scene[:word]
    field_width = scene[:fieldWidth] 
    field_height = scene[:fieldHeight]
    word_width = scene[:wordImageWidth]
    word_height = scene[:wordImageHeight] 

    # Your placement algorithm:
	# xScatter = (1-word.weight);
    # x = map ( random (-xScatter, xScatter), -1, 1, 30, field_width - word_width - 30);
    # y = (1-pow(word.weight, 0.25)) * (field_height - word_height) + 30;  
   
    {x, y}	
end

WordCram.new(self) do |options|
	options.from(web: 'http://en.wikipedia.org/wiki/Portable_Document_Format')    
	options.from(html: '<html>...</html>')
	options.from(text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit')    
	options.from(file: 'text_file.txt')
   
	options.with_color(color(255, 0, 0))	
	options.with_colors(color(255, 0, 0), color(0, 255, 0))
	
	options.with_fonts("LiberationSans", "TimesNewRoman")
	options.with_font("LiberationSans")	
	
	options.sized_by_weight(mix: 1, max: 30)
	options.sized_by_rank(mix: 1, max: 30)
	
	options.with_word_padding(1)
	
	options.angled_at(0)           
	
	options.with_placer(myplacer)
     
	options.save_to('output.tiff')  
end
```