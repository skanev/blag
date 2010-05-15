Then 'I should see the following HTML:' do |html|
  page.body.to_s.should include(html.strip)
end