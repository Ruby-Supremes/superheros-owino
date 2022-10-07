# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

hero_strength = ['Strong', 'Weak', 'Average']

puts "🌱 Seeding data..."
5.times do
    Hero.create(name: Faker::Name.unique.name, super_name: Faker::Games::Heroes.unique.name)
end

hero_strength.each do |strength|
    Hero.all.each do |hero|
        rand(1..8).times do
            power=Power.create(name: Faker::Games::Heroes.unique.artifact,description: Faker::Lorem.paragraph(sentence_count: 3))

        # get a random restaurant for every power
            hero = Hero.order('RANDOM()').first

            HeroPower.create(strength: strength, power_id:power.id, hero_id:hero.id)
        end
    end
end
puts "🌱 Done seeding!"