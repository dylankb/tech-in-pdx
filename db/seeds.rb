# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

companies = [
  ["Airbnb", "Airbnb"],
  ["Puppet Labs", "puppetize"],
  ["New Relic", "newrelic"],
  ["Womply", "womply"]
]

portland = Location.create(city: "Portland", state: "OR")

technologies = Technology.create([{ name: 'ruby'},{name: 'ruby-on-rails'}, {name: 'javascript'}])

companies.each do |name, handle|
  company = Company.create(name: name, twitter_handle: handle)
  company.locations.push(portland)
  technologies.each do |technology|
    company.technologies.push(technology)
  end
end
