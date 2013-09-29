require 'test/unit'

require 'nokogiri'
require 'rexml/document'
class RexmlTest < Test::Unit::TestCase

  def test_nokogiri
    xml = File.open(File.dirname(__FILE__) + '/test.xml').read
    soaprsp = Nokogiri::XML(xml)
    ns = {'xmlns:z' => "#RowsetSchema"}
    items = []
    soaprsp.xpath('//z:row', ns).each do |li|
      items << li
    end

    assert(items.size == 3, "Items should be 3 but is #{items.size}")
  end

  def test_rexml
    xml = File.open(File.dirname(__FILE__) + '/test.xml').read
    soaprsp = REXML::Document.new(xml)
    #soaprsp = REXML::Document.new(File.open("test.xml").read)
    ns = {'z' => "#RowsetSchema"}
    items = []
    REXML::XPath.each(soaprsp.root,'//z:row',ns) {|e| items << e }

    assert(items.size == 3, "Rexmls Items should be 3 but is #{items.size}")

  end

end