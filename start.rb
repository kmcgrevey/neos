require_relative 'near_earth_objects'
require_relative 'neo_table'

def start
  intro
  @date = gets.chomp
  @astroid_details = NearEarthObjects.find_neos_by_date(@date)
  results
end

def formatted_date
  DateTime.parse(@date).strftime("%A %b %d, %Y")
end

def intro
  puts "________________________________________________________________________________________________________________________________"
  puts "Welcome to NEO. Here you will find information about how many meteors, astroids, comets pass by the earth every day. \nEnter a date below to get a list of the objects that have passed by the earth on that day."
  puts "Please enter a date in the following format YYYY-MM-DD."
  print ">> "
end

def results
  puts "______________________________________________________________________________"
  puts "On #{formatted_date}, there were #{@astroid_details[:total_number_of_astroids]} objects that almost collided with the earth."
  puts "The largest of these was #{@astroid_details[:biggest_astroid]} ft. in diameter."
  puts "\nHere is a list of objects with details:"
  
  NeoTable.construct(@astroid_details[:astroid_list])
end

start