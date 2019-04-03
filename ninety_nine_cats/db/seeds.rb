# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.destroy_all

ActiveRecord::Base.transaction do
    c1 = Cat.create!(name: "Salvia", birth_date: "2010/1/1", color: "BLACK", sex: "F")
    c2 = Cat.create!(name: "Mr Mittens", birth_date: "2015/4/5", color: "ORANGE", sex: "M")
    c3 = Cat.create!(name: "Mousse", birth_date: "2017/8/30", color: "WHITE", sex: "F")
    c4 = Cat.create!(name: "Prof Snuggles", birth_date: "2012/12/25", color: "BROWN", sex: "F")
    c5 = Cat.create!(name: "Seitan", birth_date: "1/1/1", color: "BLACK", sex: "M")
end