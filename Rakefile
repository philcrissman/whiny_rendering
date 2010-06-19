require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('whiny_rendering', '0.1.0') do |g|
  g.description = "Add a helper that will be explicitly whiny about what templates and/or partials are being rendered."
  g.url = "http://github.com/philcrissman/whiny_rendering"
  g.author = "Phil Crissman"
  g.email = "phil@betadeluxe.com"
  g.ignore_pattern = ["tmp/*", "script/*"]
  g.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }