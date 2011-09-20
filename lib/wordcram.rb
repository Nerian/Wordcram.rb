require 'java'

require 'ruby-processing'

# Wordcram dependencies
require_relative '../vendor/WordCram.jar'
require_relative '../vendor/jsoup-1.3.3.jar'
require_relative '../vendor/cue.language.jar'
require_relative '../vendor/processing/core.jar'
require_relative '../vendor/processing/itext.jar'
require_relative '../vendor/processing/pdf.jar'

require_relative 'styles/styles'
Processing::App::SKETCH_PATH = '.'

# This is the main interface. The API that most users are going to use.

class Wordcram 
  VERSION = '0.1.0'

	def self.draw(&block)
		Sketch.new(&block)
	end

	class Sketch < Processing::App
		include Style
		attr_accessor :wordcram, :block

		def initialize(&block)
			@block = block
			super()
		end

		def canvas(&block)
			self.instance_eval(&block)
		end

		def setup
			@wordcram = Java.wordcram.WordCram.new(self)
			self.instance_eval(&@block)
			@wordcram.draw_all()
		end

		def save_to(path)
			saveFrame(path)
		end

	end

	class Placer 
		def initialize(&block)
			@block = block
		end

		def place(data = {})
      pos = @block.call(data)
      Processing::PVector.new(pos[0],pos[1])
    end          	 

	end
end