# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances
  "SELECT name FROM guests GROUP BY name ORDER BY COUNT(name) DESC LIMIT 1;"
end

def most_popular_profession_by_year
  "SELECT year, profession FROM (SELECT year, profession, MAX(num_profession) FROM (SELECT year, profession, COUNT(profession) AS num_profession FROM guests GROUP BY year, profession ORDER BY year, COUNT(profession) DESC) GROUP BY year);"
end

def most_popular_profession
  "SELECT profession FROM guests GROUP BY profession ORDER BY COUNT(profession) DESC LIMIT 1"
end

def how_many_bills
  "SELECT COUNT(name) FROM guests WHERE name LIKE '%Bill%'"
end

def pat_stewart_dates
  "SELECT date FROM guests WHERE name = 'Patrick Stewart';"
end

def year_most_guests
  "SELECT year, COUNT(DISTINCT name) FROM guests GROUP BY year ORDER BY COUNT(DISTINCT name) DESC LIMIT 1"
end

def most_popular_group_by_year
  "SELECT year, topic FROM (SELECT year, topic, MAX(num_topic) FROM (SELECT year, topic, COUNT(topic) as num_topic FROM guests GROUP BY year, topic ORDER BY year, COUNT(topic) DESC) GROUP BY year)"
end
