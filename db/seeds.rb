# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

User.destroy_all
Product.destroy_all

#user
nathalie = User.new(first_name: "Nathalie", last_name: "Thompson", bio: "A girl living in snowy Montreal who's trying to be fancy on a budget!", address: "125 Saint Urbain, Montreal, QC", email: "nathalie@mail.com", password: "hello123" )
file = URI.open("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1834&q=80")
nathalie.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
nathalie.save!

lea = User.new(first_name: "Lea", last_name: "Robert", bio: "Lea. 22. Trying to be fashionable while living a more sustainable lifestyle.", address: "3798 Casgrain Ave, Apt. 1, Montreal, QC", email: "lea@mail.com", password: "hello123")
file = URI.open("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80")
lea.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
lea.save!

#necklaces
pearl_necklace = Product.new(name: "Women's South Sea Cultured Peal Strand", price: 37.00, description: "Beautifully lustrous and elegant. I've gotten compliments on this necklace every time I've worn it to an event!", user: nathalie)
file = URI.open("https://bnsec.bluenile.com/bluenile/is/image/bluenile/-south-sea-pearl-necklace-18k-white-gold-/57316_main?$phab_detailmain$")
pearl_necklace.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
pearl_necklace.save!

rhinestone_necklace = Product.new(name: "Simple Bridal Rhinestone Necklace", price: 53.00, description: "A simple but glamorous necklace that will stand out at any wedding!", user: lea)
file = URI.open("https://i.etsystatic.com/8728158/r/il/55af54/1659793344/il_1588xN.1659793344_575v.jpg")
rhinestone_necklace.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
rhinestone_necklace.save!

#earrings
diamond_earrings = Product.new(name: "Round Diamond Earrings", price: 68.00, description: "Stunning diamond earrings that will match any outfit! You can dress these earrings up or down.", user: nathalie)
file = URI.open("https://bnsec.bluenile.com/bluenile/is/image/bluenile/-diamond-platinum-stud-earrings-/49994_main?$phab_detailmain$")
diamond_earrings.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
diamond_earrings.save!

gold_plated_earrings = Product.new(name: "Gold Plated Teardrop Dangle Earrings", price: 32.00, description: "High quality gold plating, perfect for any prom, wedding, or special occasion", user: lea)
file = URI.open("https://bnsec.bluenile.com/bluenile/is/image/bluenile/-diamond-drop-disc-earrings-14k-/63089_main?$phab_detailmain$")
gold_plated_earrings.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
gold_plated_earrings.save!

#bracelets
heart_bracelet = Product.new(name: "Petite Heart Bracelet", price: 17.00, description: "14k rose gold with a delicate chain that can be adjusted in length", user: nathalie)
file = URI.open("https://bnsec.bluenile.com/bluenile/is/image/bluenile/-petite-heart-bracelet-in-14k-rose-gold-/65382_main?$phab_detailmain$")
heart_bracelet.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
heart_bracelet.save!

silver_bracelet = Product.new(name: "Sterling Silver Beads Bracelet", price: 28.00, description: "Sterling silver beads bracelet that adds luxe and shine to your look", user: lea)
file = URI.open("https://bnsec.bluenile.com/bluenile/is/image/bluenile/-sterling-silver-bead-bracelet-/UB16700500_main?$phab_detailmain$")
silver_bracelet.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
silver_bracelet.save!

#rings
amethyst_ring = Product.new(name: "10k Rose Gold Amethyst Ring", price: 45.00, description: "Antique-shaped amethyst with beautiful round cut diamonds", user: nathalie)
file = URI.open("https://bnsec.bluenile.com/bluenile/is/image/bluenile/-cushion-cut-amethyst-diamond-halo-cocktail-ring-14k-rose-gol-/66022_main?$phab_detailmain$")
amethyst_ring.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
amethyst_ring.save!

topaz_ring = Product.new(name: "Blue Topaz and Diamond Cocktail Ring", price: 74.00, description: "Vibrant Topaz makes a statement in this fashion-forward ring!", user: lea)
file = URI.open("https://bnsec.bluenile.com/bluenile/is/image/bluenile/-emerald-sky-blue-topaz-an-diamond-cocktail-ring-in-14k-white-gold-/75817_main?$phab_detailmain$")
topaz_ring.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
topaz_ring.save!

#sets
crystal_bridal_set = Product.new(name: "Crystal and Pearl Bridal Necklace and Earrings Set", price: 53.00, description: "Make a statement with this bridal jewelry set of necklace and earrings with sparkly crystals!", user: nathalie)
file  = URI.open("https://i.etsystatic.com/5486852/r/il/fdb0a5/1148745606/il_570xN.1148745606_g9yr.jpg")
crystal_bridal_set.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
crystal_bridal_set.save!

diamond_set = Product.new(name: "Diamond Necklace and Earrings Set in Silver", price: 71.00, description: "A timeless classic, this diamond solitaire pendant and earrings set complements elegant style!", user: lea)
file = URI.open("https://i.etsystatic.com/10154392/r/il/6bb02d/1776913841/il_570xN.1776913841_kb60.jpg")
diamond_set.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
diamond_set.save!

#unavailablities
dates1 = Unavailability.new(start_date: Date.parse("June 9 2020"), end_date: Date.parse("June 11 2020"), product: diamond_set )
dates1.save!

dates2 = Unavailability.new(start_date: Date.parse("August 15 2020") , end_date: Date.parse("August 16 2020"), product: rhinestone_necklace)
dates2.save!

puts "done seeding!"



