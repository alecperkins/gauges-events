# Usage:
# rake compile - Compiles and minify the coffeescript file
require 'uglifier'

desc 'Compiles and minify the coffeescript file'
task :compile do
  js = `coffee --print lib/gaugesevents.coffee`
  minjs = Uglifier.new.compile(js)
  data = "// Gauges Events v1.0\n#{minjs}\n"
  File.open('gaugesevents.min.js', 'w') { |f| f.write(data) }
end
