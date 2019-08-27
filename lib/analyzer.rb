require 'open-uri'
require 'nokogiri'

class Analyzer

  attr_reader :speechers

  def initialize(url = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml")
    file = open_file(url)
    @doc = Nokogiri::XML(file)
    @speechers = {}
  end

  def analyze(format: :hash)    
    @doc.xpath("//SPEECH").each do |speech|
      speech_speaker = speech.search('SPEAKER').first.content.capitalize
      speech_lines = speech.search('LINE').count

      @speechers[speech_speaker] ||= 0
      @speechers[speech_speaker] += speech_lines
    end

    @speechers = @speechers.sort_by { |k, v| -v }.to_h

    if format == :hash
      @speechers
    else
      @speechers.map {|name, lines| 
        "#{name} #{lines}\n"
      }
    end
  end

  private
  def open_file(url)
    begin
      open(url).read
    rescue
      raise "Failed to open the URL, check it please"
    end
  end

end

analyzer = Analyzer.new
puts analyzer.analyze(format: :text)