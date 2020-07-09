# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# TODO: drop tables first
# IN THE FUTURE, uncomment: 
ResourceOrg.destroy_all
scrape = Scraper.new
orgs = scrape.scrape_top_pages
ResourceOrg.create_from_collection(orgs)