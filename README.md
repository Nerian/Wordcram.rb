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
 
# How to create a Word Cloud


## The basic model

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

### Sources   

``` ruby 
options.from(web: 'http://en.wikipedia.org/wiki/Portable_Document_Format')    
options.from(html: '<html>...</html>')
options.from(text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit')    
options.from(file: 'text_file.txt')
```        

### Colors

``` ruby  
options.with_color(color(255, 0, 0))	
options.with_colors(color(255, 0, 0), color(0, 255, 0))
```   

### Fonts    

``` ruby   
options.with_fonts("LiberationSans", "TimesNewRoman")
options.with_font("LiberationSans")
```            

### Ranking the words

``` ruby
options.sized_by_weight(mix: 1, max: 30)
options.sized_by_rank(mix: 1, max: 30)
```                                

### Padding

``` ruby
options.with_word_padding(10) 
```
                
### Angle

``` ruby
options.angled_at(0)
options.angledBetween(3.5, 80.5)
```        

### Case

``` ruby 
options.case(:upper)
options.case(:lower)
options.case(:default)
```            

### Placers

``` ruby      
options.with_placer() do |scene|  
  word = scene[:word]
  field_width = scene[:field_width] 
  field_height = scene[:field_height]
  word_width = scene[:word_image_width]
  word_height = scene[:word_image_height] 
  
  x = word.weight * (field_width - word_width)
  y = word.weight * (field_height - word_height)
        
  PVector.new(x,y)        
end

options.with_placer(:horizontal_line)
options.with_placer(:center_clump)
options.with_placer(:horiz_band_anchored_left)
options.with_placer(:swirl)
options.with_placer(:upper_left)
options.with_placer(:wave)        

class my_placer

	def place(word, index, count, word_width, word_height, field_width, field_height)
		...your algorithm
		x = ..
		y = ..
		return PVector.new(x,y)
	end
end

options.with_placer(your_own_placer)

```    

### Saving the output to a file

```
options.save_to('output.tiff')
```