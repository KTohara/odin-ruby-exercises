# frozen_string_literal: true

require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'
require 'open-uri'

# Convert erb form letter into html thank you letters, and generate data charts.
class EventManager
  attr_reader :contents, :template_letter, :erb_template, :contents_size

  def initialize(csv_file, form_letter)
    @contents = CSV.read(csv_file, headers: true, header_converters: :symbol)
    @template_letter = File.read(form_letter)
    @erb_template = ERB.new(@template_letter)
    @contents_size = CSV.read(csv_file).length
  end

  def generate_letter
    puts 'EventManager letter generator initialized.'
    contents.each do |row|
      id = row[0]
      name = row[:first_name]
      zipcode = valid_zip(row[:zipcode])
      legislators = legislators_by_zipcode(zipcode)
      number = valid_number(row[:homephone])
      form_letter = erb_template.result(binding)

      save_thank_you_letter(id, form_letter)
    end
  end

  def most_registered_hour_chart
    puts 'Most Registered Hour initialized: hour_chart.png'
    base_url = 'https://chart.googleapis.com/chart?cht=p&chs=600x400&chtt=Most+Registered+Time+by+Hour'
    times = sort_by_hour
    chart_url = "#{base_url}&chl=#{times.keys.join('|')}&chd=t:#{times.values.join(',')}"
    File.open('output/hour_chart.png', 'w') { |file| file.puts(URI.parse(chart_url).read) }
  end

  def most_registered_day_chart
    puts 'Most Registered Day initialized: day_chart.png'
    base_url = 'https://chart.googleapis.com/chart?cht=p&chs=600x400&chtt=Most+Registered+Day'
    times = sort_by_day
    chart_url = "#{base_url}&chl=#{times.keys.join('|')}&chd=t:#{times.values.join(',')}"
    File.open('output/day_chart.png', 'w') { |file| file.puts(URI.parse(chart_url).read) }
  end

  # Helper Methods
  def valid_zip(zipcode)
    zipcode.to_s.rjust(5, '0')[0..4]
  end

  def legislators_by_zipcode(zip)
    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
    begin
      civic_info.representative_info_by_address(
        address: zip,
        levels: 'country',
        roles: %w[legislatorUpperBody legislatorLowerBody]
      ).officials
    rescue StandardError
      'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
    end
  end

  def valid_number(number)
    str_num = number.scan(/\d+/).join
    num_length = str_num.length
    if num_length == 10
      str_num
    elsif num_length == 11 && str_num.start_with?('1')
      str_num.slice(1..-1)
    else
      'N/A'
    end
  end

  def save_thank_you_letter(id, form_letter)
    Dir.mkdir('output') unless Dir.exist?('output')
    file_name = "output/thanks_#{id}.html"
    File.open(file_name, 'w') { |file| file.puts form_letter }
  end

  def sort_by_hour
    contents.each_with_object(Hash.new { |h, k| h[k] = 0 }) do |row, acc|
      date = DateTime.strptime(row[:regdate], '%m/%d/%y %H:%M')
      acc[date.strftime('%H:00')] += 1
    end
  end

  def sort_by_day
    contents.each_with_object(Hash.new { |h, k| h[k] = 0 }) do |row, acc|
      date = DateTime.strptime(row[:regdate], '%m/%d/%y %H:%M')
      acc[date.strftime('%A')] += 1
    end
  end
end

csv = File.expand_path('../event_attendees.csv', File.dirname(__FILE__))
erb = File.expand_path('../form_letter.erb', File.dirname(__FILE__))

events = EventManager.new(csv, erb)
events.generate_letter
events.most_registered_hour_chart
events.most_registered_day_chart
