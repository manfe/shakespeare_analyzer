require 'analyzer'

RSpec.configure do |config|
  macbeth_file = File.open("spec/fixtures/macbeth.xml").read

  config.before(:each) do
    stub_request(:get, "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml").
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: macbeth_file, headers: {})
  end
end

RSpec.describe Analyzer, "#xml analyzer" do
  context "when a xml file is called" do
    it "counts how many spoken lines each has for each speecher" do
      analyzer = Analyzer.new
      expect(analyzer.analyze).to be_an_instance_of(Hash)
      expect(analyzer.analyze).not_to be_empty

      # the stubbed for this request is fixtures/macbeth.xml
      # check spec_helper.rb if needed
      expect(analyzer.analyze["First witch"]).to be_equal(12)
    end
  end
end