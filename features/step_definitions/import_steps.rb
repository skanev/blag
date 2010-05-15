When 'I import the following wordpress.xml:' do |xml|
  dump = Tempfile.new('wordpress-import-test')
  dump.write xml.strip
  dump.flush

  WordPressImport.import_file dump.path
end