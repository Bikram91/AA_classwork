# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :artworks,
    foreign_key: :artist_id,
    class_name: :Artwork,
    inverse_of: :viewer,
    dependent: :destroy

    has_many :artwork_shares,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    inverse_of: :viewer,
    dependent: :destroy

    has_many :shared_artwork,
    through: :artwork_shares,
    source: :artwork,
    dependent: :destroy

    has_many :comments,
    foreign_key: :author_id,
    class_name: :Comment,
    inverse_of: :author,
    dependent: :destroy
end
