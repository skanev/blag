require 'spec_helper'

describe WordPressImport do
  it "#convert_internal_links(base_url, content) should remove base_url from hyperlinks in content" do
    WordPressImport.convert_internal_links("http://example.org", '<a href="http://example.org/internal-link">Internal link</a>').should == 
        '<a href="/internal-link">Internal link</a>'
    WordPressImport.convert_internal_links("http://example.org", '[internal link](http://example.org/internal-link)').should ==
        '[internal link](/internal-link)'
    WordPressImport.convert_internal_links("http://example.org", '<a href="http://external.example.org">External link</a>').should ==
        '<a href="http://external.example.org">External link</a>'
  end
end