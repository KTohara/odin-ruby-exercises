require 'csv'

def valid_zip(zipcode)
  case
  when zipcode.nil? then '00000'
  when zipcode.length > 5 then zipcode[0...5]
  when zipcode.length < 5 then zipcode.rjust(5, '0')
  else zipcode
  end
end

puts 'EventManager initialized.'

contents = CSV.open(
  '../event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  zipcode = valid_zip(row[:zipcode])

  puts "#{name} #{zipcode}"
end