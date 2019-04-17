#!/usr/bin/env ruby

require 'fileutils'
require 'nokogiri'

#
# Converts portions of the Virtuoso DocBook documentation to Markdown
# using pandoc.
#
class VirtDocConv

  attr_accessor :doc
  attr_reader :output_dir # Root folder for holding the converted book

  def initialize (xmlDoc)
    @output_dir = "./virtdoc_md_conversion"
    self.doc = Nokogiri::XML(File.read(xmlDoc)) do |config|
      config.huge
    end
    self.doc.remove_namespaces!
  end

  def check_for_pandoc
    unless system("pandoc --version >/dev/null 2>&1") 
      raise "ERROR: pandoc is not available. Please install it."
    end
  end

  #
  # Extracts the chapter names
  #
  def chapter_names
    rChapters = []
    chapter_index = 0
    self.doc.xpath('//chapter').each do |el_chapter|
      el_chapter.xpath('./title | ./info/title').each do |el_title|
        chapter_index += 1
        chapter_title = el_title.content.strip.gsub(/\s+/, ' ')
        rChapters << "#{chapter_index} - #{chapter_title}"
      end
    end
    rChapters
  end

  #
  # Creates a tree of folders, one per chapter
  #
  def create_folder_tree
    root_dir = self.output_dir
    if File.exist? root_dir   
      if !File.directory? root_dir
        raise "File #{root_dir} is preventing creation of a directory of the same name"
      else
        # Clear the existing tree
        # TO DO: Ask for confirmation
        FileUtils.rm_r root_dir, :force => true
      end
    end

    FileUtils.mkdir root_dir
    FileUtils.cd(root_dir) do

      FileUtils.mkdir(chapter_names)
    end
  end

  #
  # Creates a Markdown version of a chapter abstract in the chapter's folder
  #
  # The pandoc conversion of DocBook to Markdown is lossy. 
  # It loses a good deal of information including any chapter abstract.
  # So we extract the abstract here and convert is separately.
  def create_abstract(ch_indx, ch_name)
    chapter_abstract = extract_docbook_abstract(ch_indx, ch_name)
#    if chapter_abstract.length
#      puts "chapter #{ch_indx} [#{ch_name}]:  abstract >>>"
#      puts chapter_abstract
#      puts "<<<"
#    else
#      puts "!No abstract"
#    end

    f_basename = "abstract#{ch_indx + 1}"
    write_file(chapter_abstract, "#{self.output_dir}/#{ch_name}", f_basename, ".md")
  end

  def convert_chapter(ch_indx, ch_name)
    chapter_xml = extract_docbook_chapter(ch_indx, ch_name)
    
    # Write the XML to a temp file
    f_basename = "chapter#{ch_indx + 1}"
    xml_f_path = write_file(chapter_xml, "#{self.output_dir}/#{ch_name}", f_basename, ".xml")
    puts "xml_f_path: #{xml_f_path}"
    md_f_path = "#{self.output_dir}/#{ch_name}/#{f_basename}.md"
    puts "md_f_path: #{md_f_path}"
    
    # Convert using pandoc
    docbook_to_md(xml_f_path, md_f_path)

    # Remove the temp file
    FileUtils.rm(xml_f_path)
  end

  # The returned abstract is raw text, separated into paragraphs.
  # FIX ME: 
  # Any other structural elements contained in the abstract are lost.
  # e.g. Some abstracts contain simple lists. These lists are collapsed
  # to raw text in the paragraph. They will require manually reformatting
  # in the emitted Markdown.
  def extract_docbook_abstract(ch_indx, ch_name)
    abstract = ""
    el_chapter = self.doc.xpath('//chapter')[ch_indx]
    el_chapter.xpath('./info').each do |el_info|
      el_info.xpath('./abstract').each do |el_abstract|
        el_abstract.xpath('./para').each do |el_para|
          para = el_para.content.strip.gsub(/\s+/, ' ') + "\n\n"
          abstract << para
        end
      end
    end  
    abstract
  end

  def extract_docbook_chapter(ch_indx, ch_name)
    el_chapter = self.doc.xpath('//chapter')[ch_indx]
    chapter_xml = el_chapter.to_s
    #chapter_xml
  end

  # in_file: input file containing DocBook XML
  # out_file: output file to receive the Markdown
  def docbook_to_md(in_file, out_file)
    begin
      cmd = %Q{pandoc -f docbook -t gfm -o "#{out_file}" "#{in_file}"}
      puts(cmd)
      cmd_output = %x{#{cmd} 2>&1}
      if $?.exitstatus == 0
        puts("#{in_file}: Conversion successful")
      else
        puts("!ERROR: pandoc conversion failed - #{cmd_output}")
      end
    end
  end

  def write_file(f_content, f_dir, f_name, f_ext)
    f_path = "#{f_dir}/#{f_name}#{f_ext}"
    FileUtils.cd(f_dir) do
      open("#{f_name}#{f_ext}", "w") do |f|
        f << f_content
      end
    end
    f_path
  end

  #
  # The virtuoso docbook source keeps all the book's images
  # in a single folder.
  # 
  # For easier management, collect_chapter_images gathers the images 
  # belonging to a chapter into 
  # their own folder, with the chapter folder as the parent.
  #
  def collect_chapter_images
    # TO DO: Finish
    # ? Handling of images shared across chapters
    # ? Copy the images, don't move them, from their source location.
  end

end

# ===========================================================================


converter = VirtDocConv.new('alldocs.xml')

# Check pandoc is installed
begin
  converter.check_for_pandoc 
rescue Exception => e
  puts e
  exit 1
end

converter.create_folder_tree
ch_names = converter.chapter_names
ch_names.each_index do |ch_indx| 
  ch_name = ch_names[ch_indx]
  puts "Chapter: " + ch_name

  puts "Creating abstract..."
  converter.create_abstract(ch_indx, ch_name)
  
  puts "Converting chapter..."
  converter.convert_chapter(ch_indx, ch_name)
end