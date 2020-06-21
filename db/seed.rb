require "pry"
require "sqlite3"
# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
db = SQLite3::Database.new(':memory:')
db.execute("CREATE TABLE guests (
  id INTEGER PRIMARY KEY,
  year INTEGER,
  profession TEXT,
  date TEXT,
  topic TEXT,
  name TEXT
);");
guests = File.open("daily_show_guests.csv", "r")
guests.each_with_index do |line, index|
  next if index == 0
  line_data = line.split(",")
  name = line_data[4..-1].join(",").chomp.gsub("'", "''")
  # if line_data.count > 5
  #   binding.pry
  # end
  puts "INSERT INTO guests (year, profession, date, topic, name) VALUES (#{line_data[0]}, #{line_data[1].inspect}, #{line_data[2].inspect}, #{line_data[3].inspect}, #{line_data[4..-1].join(",").chomp.inspect});"
  db.execute("INSERT INTO guests (year, profession, date, topic, name) VALUES (#{line_data[0]}, #{line_data[1].inspect}, #{line_data[2].inspect}, #{line_data[3].inspect}, \'#{name}\');")
end

binding.pry

"Hi!"
