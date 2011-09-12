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

``` ruby
session   = CrystalEnterprise.getSessionManager.logon(user, password, cms, authtype)
infostore = session.getService('', 'InfoStore')
```

With a little bit of effort, this interaction could be made to feel a lot more
natural to a native Rubyist. The code shown below is much closer to what you
should be aiming for.

``` ruby
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
 
# How to create a Word Cloud


## The basic canvas

The word cloud is made of a __list of words__, a __canvas__ where these words are drawn and __modifiers__.

This is the simplest word cloud. It takes as a source of words a string.
         
``` ruby       

require 'wordcram'   
                           
Processing::App::SKETCH_PATH = '.'
class Sketch < Processing::App
  
  def setup    
    size 350, 350
    wordcram = Wordcram.new(self) do |options|    
		options.from(:text_string => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit')    						
    end     
                                                                                                        
	wordcram.draw_all
  end                                                                                                               
end     

Sketch.new

```       

All modifiers are accessible as instance variables of the class Wordcram. You can use all the modifiers using the `options` variable that you get in the block.        

### Development 

``` bash
git clone git@github.com:Nerian/s9-e1.git
cd s9-e1.git/
bundle install
git submodule init
git submodule update
```

Rename the file `spec/sample.rb.example` to `spec/sample.rb``and uncomment the lines that you want to test.

``` bash
cp spec/sample.rb.example spec/sample.rb
jruby spec/sample.rb
```

### Sources   

``` ruby 
options.from(web: 'http://en.wikipedia.org/wiki/Portable_Document_Format')    
options.from(html: '<html>...</html>')
options.from(text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit')    
options.from(file: 'text_file.txt')
```        

### Colors                                                           

Word can have a color. Colors are defined in RGB format.

``` ruby			

color(__red__,__green__,__blue__)
	
red = color(255,0,0)
         
# Define the color of all words
options.with_color(color(255,0,0))	

# The words will have colors randomly picked from the list of colors. 
options.with_colors(color(255, 0, 0), color(0, 255, 0), ...)
```   

### Fonts    

``` ruby   
options.with_fonts("LiberationSans", "TimesNewRoman")
options.with_font("LiberationSans")
```            

### Ranking the words

The importance of a word is measured by how many times it appears in the __source__. You can set that more important words are bigger than the less important words using the following methods.

``` ruby
options.sized_by_weight({mix: 1, max: 30})     

options.sized_by_rank({mix: 1, max: 30})
```                                

### Padding    

The minimum space between words.

``` ruby
options.with_word_padding(10) 
```
                
### Angle  

The angle of words.

``` ruby
options.angled_at(0)
options.angledBetween(3.5, 80.5)
```        

### Case   

Whether they are all UPPER CASE, lower case, of default – no changes in the source.

``` ruby 
options.case(:upper)
options.case(:lower)
options.case(:default)
```            

### Placers 

Words are placed using an algorithm that takes into account different parameters. The code block is ran for each word.

``` ruby      
options.with_placer() do |scene|  
	... you algorithm goes here ...
	x = ...
	y = ...
	# It must return a PVector, which set the position for that word.
	PVector.new(x,y)        
end          
```     

The __scene__ parameter in the block has the following information: 

``` ruby                                                           

scene[:word]
scene[:word_index]
scene[:words_count]
scene[:word_image_width]
scene[:word_image_height]
scene[:field_width]
scene[:field_height]

```         

There are a couple of Placers already defined.

``` ruby

options.with_placer(:horizontal_line)
options.with_placer(:center_clump)
options.with_placer(:horiz_band_anchored_left)
options.with_placer(:swirl)
options.with_placer(:upper_left)
options.with_placer(:wave)  

```     

If you are going to define a complex algorithm you may want to use a class. You need to implement a `place` method.

``` ruby      

class MyPlacer

	def place(word, index, count, word_width, word_height, field_width, field_height)
		...your algorithm
		x = ..
		y = ..
		return PVector.new(x,y)
	end
end

options.with_placer(MyPlacer.new)

```    

### Saving the output to a file


``` ruby       

require 'wordcram'   
                           
Processing::App::SKETCH_PATH = '.'
class Sketch < Processing::App
  
  def setup    
    size 350, 350
    wordcram = Wordcram.new(self) do |options|    
		options.from(:text_string => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit')    						
    end     
                                                                                                        
	wordcram.draw_all
  end                
   
  saveFrame('output.png')                                                                                             
end     

Sketch.new

```