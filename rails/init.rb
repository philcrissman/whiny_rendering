require File.join(File.dirname(__FILE__), *%w[.. lib whiny_rendering])
ActionView::Base.send :include, WhinyRendering