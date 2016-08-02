desc "Import SAT/ACT Math Tests, Sections, and Questions"
task :import => :environment do |cmd_name|
	if ENV['file_name']
  	Importer.new.import(ENV['file_name'])
  else
  	puts "Enter the name of the file to be imported from the datafiles directory (e.g. file_name=Departures.csv)"
  	exit 0
  end
end