# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Product.destroy_all

#user
nathalie = User.new(first_name: "Natalie", last_name: "Thompson", bio: "A girl living in snowy Montreal who's trying to be fancy on a budget!", address: "125 Saint Urbain, Montreal, QC", email: "natalie@mail.com", password: "hello123" )
nathalie.save!

lea = User.new(first_name: "Lea", last_name: "Robert", bio: "Lea. 22. Trying to be fashionable while living a more sustainable lifestyle.", address: "3798 Casgrain Ave, Apt. 1, Montreal, QC", email: "lea@mail.com", password: "hello123")
lea.save!

#necklaces
pearl_necklace = Product.new(name: "Women's South Sea Cultured Peal Strand", price: 37.00, description: "Beautifully lustrous and elegant. I've gotten compliments on this necklace every time I've worn it to an event!", user: nathalie)
pearl_necklace.save!

rhinestone_necklace = Product.new(name: "Simple Bridal Rhinestone Necklace", price: 53.00, description: "A simple but glamorous necklace that will stand out at any wedding!", user: lea)
rhinestone_necklace.save!

#earrings
diamond_earrings = Product.new(name: "Round Diamond Earrings", price: 68.00, description: "Stunning diamond earrings that will match any outfit! You can dress these earrings up or down.", user: nathalie)
diamond_earrings.save!

gold_plated_earrings = Product.new(name: "Gold Plated Teardrop Dangle Earrings", price: 32.00, description: "High quality gold plating, perfect for any prom, wedding, or special occasion", user: lea)
gold_plated_earrings.save!

#bracelets
heart_bracelet = Product.new(name: "Petite Heart Bracelet", price: 17.00, description: "14k rose gold with a delicate chain that can be adjusted in length", user: nathalie)
heart_bracelet.save!

silver_bracelet = Product.new(name: "Sterling Silver Beads Bracelet", price: 28.00, description: "Sterling silver beads bracelet that adds luxe and shine to your look", user: lea)
silver_bracelet.save!

#rings
amethyst_ring = Product.new(name: "10k White Gold Amethyst Ring", price: 45.00, description: "Antique-shaped amethyst with beautiful round cut diamonds", user: nathalie)
amethyst_ring.save!

topaz_ring = Product.new(name: "Blue Topaz and Diamond Cocktail Ring", price: 74.00, description: "Vibrant Topaz makes a fashion forward statement in this fashion-forward ring!", user: lea)
topaz_ring.save!

#sets
crystal_bridal_set = Product.new(name: "Crystal Bridal Necklace and Earrings Set", price: 53.00, description: "Make a statement with this bridal jewelry set of necklace and earrings with sparkly crystals!", user: nathalie)
crystal_bridal_set.save!

diamond_set = Product.new(name: "Diamond Solitaire Pendant and Earrings Set in 10K White Gold", price: 71.00, description: "A timeless classic, this diamond solitaire pendant and earrings set complements elegant style!", user: lea)
diamond_set.save!

#unavailablities
dates1 = Unavailability.new(start_date: Date.parse("June 9 2020"), end_date: Date.parse("June 11 2020"), product: diamond_set )
dates1.save!

dates2 = Unavailability.new(start_date: Date.parse("August 15 2020") , end_date: Date.parse("August 16 2020"), product: rhinestone_necklace)
dates2.save!

puts "done seeding!"



