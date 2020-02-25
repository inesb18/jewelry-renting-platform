# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

natalie = User.new(first_name: "Natalie", last_name: "Thompson", bio: "A girl living in snowy Montreal who's trying to be fancy on a budget!", address: "125 Saint Urbain, Montreal, QC", email: "natalie@mail.com", password: "hello123" )
natalie.save!

lea = User.new(first_name: "Lea", last_name: "Robert", bio: "Lea. 22. Trying to be fashionable while living a more sustainable lifestyle.", address: "3798 Casgrain Ave, Apt. 1, Montreal, QC", email: "lea@mail.com", password: "hello123")
lea.save!

Product.destroy_all

pearl_necklace = Product.new(name: "Women's South Sea Cultured Peal Strand", price: 37.00, description: "Beautifully lustrous and elegant. I've gotten compliments on this necklace every time I've worn it to an event!")
pearl_necklace.save
# pearl_necklace = Product.new(name: "Women's South Sea Cultured Peal Strand", price: 37.00, description: "Beautifully lustrous and elegant. I've gotten compliments on this necklace every time I've worn it to an event!", user: natalie)
# earrings = Product.new(name: "Round Diamond Earrings", price: 68.00, description: "Stunning diamond earrings that will match any outfit! You can dress these earrings up or down.", user: lea)




