# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rushing.count == 0
  path = File.join(File.dirname(__FILE__), "./seeds/rushing.json")
  records = JSON.parse(File.read(path))
  records.each do |record|
    Rushing.create!(player: record['Player'], team: record['Team'], pos: record['Pos'],
                    att: record['Att'], att_by_g: record['Att/G'], yds: record['Yds'],
                    avg: record['Avg'], yds_by_g: record['Yds/G'], td: record['TD'],
                    lng: record['Lng'], first: record['1st'], first_percentage: record['1st%'],
                    twenty_plus: record['20+'], forty_plus: record['40+'], fum: record['FUM'])
  end
  puts "Rushings are seeded"
end
