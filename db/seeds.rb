# This file should contain all the record creation needed to seed the database wit its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require 'csv'

AnimalArea.delete_all

CSV.foreach("./db/cats.csv", headers: true) do |row|
  fsa = row.fetch("forward_sorting_area")
  cats = row.fetch("licenses_issued")
  AnimalArea.create!(forward_sorting_area: fsa, cats: cats)
  sleep 0.5
end

CSV.foreach("./db/dogs.csv", headers: true) do |row|
  fsa = row.fetch("forward_sorting_area")
  dogs = row.fetch("licenses_issued")
  area = AnimalArea.find_by!(forward_sorting_area: fsa)
  area.update_attributes(dogs: dogs)
end
