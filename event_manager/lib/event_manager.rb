require 'csv'

puts 'Event Manager Initialized!'

lines = File.readlines('event_attendees.csv')
lines.each.with_index do |line, i|
  next if i.zero?
  col = line.split(',')
  name = col[2]
  puts name
end

