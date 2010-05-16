require 'spec_helper'

describe CommentSanitizer do
  describe ".clean(content)" do
    it "should return nil if content is nil" do
      CommentSanitizer.clean(nil).should be_nil
    end

    [
      '<em>text</em>',
      '<strong>text</strong>',
      '<ul><li>item</li></ul>',
      '<ol><li>item</li></ol>',
      '<code>source</code>',
      '<pre lang="java">Java code</pre>',
      '<blockquote>quote</blockquote>',
    ].each do |html|
      it "should allow '#{html}'" do
        CommentSanitizer.clean(html).should == html
      end
    end

    [
      ['<script>javascript code</script>', 'javascript code'],
      ['<img src="larodi.gif" />', ''],
      ['<a href="#">link</a>', '<a href="#" rel="nofollow">link</a>'],
      ['<a href="javascript:foo()">link</a>', '<a rel="nofollow">link</a>'],
      ['<a href="#" onclick="evil();">link</a>', '<a href="#" rel="nofollow">link</a>'],
    ].each do |input, cleaned|
      it "should transform '#{input}' to '#{cleaned}'" do
        CommentSanitizer.clean(input).should == cleaned
      end
    end
  end
end