# Wordcram wrapper

http://wordcram.org/

Create awesome word clouds!

<img width='700px' src='http://wordcram.files.wordpress.com/2011/03/wordcram-4th-copy.png'></img>

# How to create a Word Cloud


## The basic canvas

The word cloud is made of a __list of words__, a __canvas__ where these words are drawn and __modifiers__.

This is the simplest word cloud. It takes as a source of words a string and save the image.

``` ruby  
require 'wordcram'

Wordcram.draw do
	canvas do
		size 700, 700
	end

	from('Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
	  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
	  fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa
	  qui officia deserunt mollit anim id est laborum', :as => :text)

	save_to('output.png')
end
```  

### Install

``` bash
gem install wordcram
```


### Development

``` bash
git clone git@github.com:Nerian/s9-e1.git
cd s9-e1.git/
bundle install
git submodule init
git submodule update
```

Rename the file `spec/sample.rb.example` to `spec/sample.rb` and uncomment the lines that you want to test.

``` bash
export JRUBY_OPTS=--1.9

cp spec/sample.rb.example spec/sample.rb

jruby spec/sample.rb
```

### Sources

``` ruby
from('http://en.wikipedia.org/wiki/Portable_Document_Format', :as => :web_page)   

from('<html>...</html>', :as => :html_string)

from('Lorem ipsum dolor sit amet, consectetur adipisicing elit', :as => :text_string)

from('text_file.txt', :as => :text_file)

from('page.html', :as => :html_file)            

```

### Colors

Words can be colored

``` ruby
colors(black, red, green, blue)      

```

### Fonts

``` ruby
fonts("LiberationSans")
fonts("LiberationSans", "TimesNewRoman", ...) 

```

### Ranking the words

The importance of a word is measured by how many times it appears in the __source__. You can set that more important words are bigger than the less important words using the following methods.

``` ruby
sized_by_weight({mix: 1, max: 30})

sized_by_rank({mix: 1, max: 30})   

```

### Padding

The minimum space between words.

``` ruby
word_padding(10)  

```

### Angle

The angle of words.

``` ruby
angled_at(0)
angled_between(0, 50) 

```

### Case

Whether they are all UPPER CASE, lower case, of default – no changes in the source.

``` ruby
case(:upper)
case(:lower)
case(:default)    

```

### Placers

Words are placed using an algorithm that takes into account different parameters. The code block is ran for each word.

``` ruby
placer { |data|   
	x = data[:word].weight *  (data[:field_width] - data[:word_width])
	y = data[:word].weight * (data[:field_height] - data[:word_height])
	[x, y] }        
	
```
This is the information available inside that block.

``` ruby
data[:word]
data[:index]
data[:count]
data[:word_width]
data[:word_height]
data[:field_width]
data[:field_height]

```

There are a couple of Placers already defined.

``` ruby       
placer(:horizontal_line)
placer(:center_clump)
placer(:horiz_band_anchored_left)
placer(:swirl)
placer(:upper_left)
placer(:wave)

```

### Full example


``` ruby
require_relative '../lib/wordcram'
#require 'wordcram' # install the gem first.

Wordcram.draw do
	canvas do
		size 700, 700
		background black
	end

	from('Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
	  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
	  fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa
	  qui officia deserunt mollit anim id est laborum', :as => :text)

	colors(blue, green, yellow, red)

	fonts "LiberationSans"

	sized_by_weight({:mix => 30, :max => 35})

	word_padding 10

	angled_at 70
	angled_between 70, 90

	text_case :upper
	text_case :lower
	text_case :default

	placer { |data|   
    	x = data[:word].weight *  (data[:field_width] - data[:word_width])
    	y = data[:word].weight * (data[:field_height] - data[:word_height])
    [x, y] }
 
	save_to('output.png')
end                      

```

# Licence

Copyright (c) 2011 Gonzalo Rodríguez-Baltanás Díaz

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.