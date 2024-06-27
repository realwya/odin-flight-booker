# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
airports = [
  { name: "北京首都国际机场", code: "PEK" },
  { name: "上海浦东国际机场", code: "PVG" },
  { name: "广州白云国际机场", code: "CAN" },
  { name: "成都双流国际机场", code: "CTU" },
  { name: "深圳宝安国际机场", code: "SZX" },
  { name: "昆明长水国际机场", code: "KMG" },
  { name: "西安咸阳国际机场", code: "XIY" },
  { name: "重庆江北国际机场", code: "CKG" },
  { name: "杭州萧山国际机场", code: "HGH" },
  { name: "南京禄口国际机场", code: "NKG" },
  { name: "厦门高崎国际机场", code: "XMN" },
  { name: "长沙黄花国际机场", code: "CSX" },
  { name: "青岛流亭国际机场", code: "TAO" },
  { name: "武汉天河国际机场", code: "WUH" },
  { name: "三亚凤凰国际机场", code: "SYX" }
]

Airport.destroy_all

airports.each do |airport|
  Airport.create!(
    name: airport[:name],
    code: airport[:code]
  )
end

puts "Created #{Airport.count} airports!"

100.times do
  departure_airport = Airport.order("RANDOM()").first
  arrival_airport = Airport.where.not(id: departure_airport.id).order("RANDOM()").first

  Flight.create!(
    date: rand(2.months.from_now..1.year.from_now),
    duration_in_minutes: rand(60..600),
    number_of_passengers: rand(50..300),
    departure_airport_id: departure_airport.id,
    arrival_airport_id: arrival_airport.id
  )
end

puts "成功创建了 #{Flight.count} 个航班记录!"

# 输出一些示例航班信息
puts "\n示例航班信息:"
Flight.order("RANDOM()").limit(5).each do |flight|
  puts "航班 ID: #{flight.id}"
  puts "  出发: #{flight.departure_airport.name} (#{flight.departure_airport.code})"
  puts "  到达: #{flight.arrival_airport.name} (#{flight.arrival_airport.code})"
  puts "  日期: #{flight.date}"
  puts "  持续时间: #{flight.duration_in_minutes} 分钟"
  puts "  乘客数: #{flight.number_of_passengers}"
  puts ""
end
