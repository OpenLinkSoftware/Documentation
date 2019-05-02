#!/usr/bin/env ruby

require './toc_gen'
require 'fileutils'

Dir.chdir('./virtdoc_md_conversion') do
  Dir.glob(File.join("**","chapter*.md")) do |f|
    puts "Generating TOC for #{f}"
    tocgen = TocGen.new(f)
    tocgen.insert_toc
  end
end
puts "Done!"
