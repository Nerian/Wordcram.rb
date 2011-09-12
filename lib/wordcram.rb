$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'java'                
   
require 'ruby-processing' 

# Wordcram dependencies
require '../vendor/WordCram.jar'
require '../vendor/jsoup-1.3.3.jar'
require '../vendor/cue.language.jar'
require '../vendor/processing/core.jar'   
require '../vendor/processing/itext.jar'
require '../vendor/processing/pdf.jar'              

require 'wordcram/wordcram'