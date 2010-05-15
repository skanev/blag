desc "Imports wordpress.xml"
task :import, [:path] => :environment do |task, args|
  WordPressImport.import_file args.path
end