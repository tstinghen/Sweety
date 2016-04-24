  desc "Import test data." 
  task :import_entries => :environment do
    File.open("entries.txt", "r").each do |line|
      cbg, date = line.strip.split("\t")
      e = Entry.new(:cbg => cbg, :date => date)
      e.save
    end
  end