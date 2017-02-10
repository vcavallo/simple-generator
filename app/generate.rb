#!/usr/bin/env ruby

if ARGV.empty?
  abort <<-EOF
    pass an adjacent yml filename as first arg, template filename as second
    it will output an index.html in the public directory
  EOF
end

require 'erb'
require 'pry'

yml_filename = ARGV[0]
template_filename = ARGV[1]

yml = YAML::load_file(File.join(__dir__, yml_filename))
template = File.read(template_filename)

@objects = yml

renderer = ERB.new(template)

html = renderer.result

#FileUtils.touch('public/index.html')
File.open('../public/index.html', 'w') { |f| f.write(html) }
