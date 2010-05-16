Then 'I should see the following HTML:' do |html|
  page.body.to_s.should include(html.strip)
end

Then 'I should see a link to "$href"' do |href|
  page.should have_xpath("//a[@href = '#{href}'")
end