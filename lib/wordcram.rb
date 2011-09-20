require 'java'

require 'ruby-processing'

# Wordcram dependencies
require_relative '../vendor/WordCram.jar'
require_relative '../vendor/jsoup-1.3.3.jar'
require_relative '../vendor/cue.language.jar'
require_relative '../vendor/processing/core.jar'
require_relative '../vendor/processing/itext.jar'
require_relative '../vendor/processing/pdf.jar'

require_relative 'wordcram/styles/styles'
require_relative 'wordcram/placer'
require_relative 'wordcram/sketch'
require_relative 'wordcram/version'
Processing::App::SKETCH_PATH = '.'

# This is the main interface. The API that most users are going to use.

class Wordcram
  
  def self.draw(&block)
    Sketch.new(&block)
  end
end