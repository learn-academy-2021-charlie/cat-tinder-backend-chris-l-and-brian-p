# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

characters = [
    {
        name: 'Freddy Krueger',
        age: 10000,
        enjoys: 'Nightmares'
    },
    {
        name: 'Chucky',
        age: 67,
        enjoys: 'Toys and daycare'
    },
    {
        name: 'Jigsaw',
        age: 52,
        enjoys: "Games"
    }
]

characters.each do |attributes|
    Character.create attributes
    puts "creating character #{attributes}"
end