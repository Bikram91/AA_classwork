# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

%w(users artworks artwork_shares).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
end

u1 = User.create!(username: "john")
u2 = User.create!(username: "bikram")
u3 = User.create!(username: "jeff")

a1 = Artwork.create!(title: "bike_artwork", image_url: "bike.com", artist_id: 2)
a2 = Artwork.create!(title: "car_artwork", image_url: "car.com", artist_id: 1)
a3 = Artwork.create!(title: "truck_artwork", image_url: "truck.com", artist_id: 3)


as1 = ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
as2 = ArtworkShare.create!(artwork_id: 2, viewer_id: 3)
as3 = ArtworkShare.create!(artwork_id: 3, viewer_id: 1)
end