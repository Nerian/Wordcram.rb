require_relative 'dsl/sources'
require_relative 'dsl/color'
require_relative 'dsl/font'
require_relative 'dsl/sizer'
require_relative 'dsl/padding'
require_relative 'dsl/angler'
require_relative 'dsl/case'
require_relative 'dsl/placer'

module Dsl  
  include Sources
  include Color
  include Font
  include Sizer
  include Padding
  include Angler
  include Case
  include Placer
end