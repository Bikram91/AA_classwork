# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  image_url  :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :bigint
#
# Indexes
#
#  index_artworks_on_artist_id  (artist_id)
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => users.id)
#
class Artwork < ApplicationRecord
    belongs_to :user,
    foreign_key: :artist_id,
    class_name: :User

    has_many :artworkshares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

    def self.artworks_for_user_id(user_id)
        Artwork
        .joins(:user)
        .joins(:artworkshares)
        .where(users: {id: user_id})
    end

    # def self.artshares_for_user_id(user_id)
    #     Artwork
    #     .joins(:artworkshares)
    #     .where(viewer_id: {id: user_id})
    # end




    validates :title, uniqueness: {scope: :artist_id, message: 'an artist can`t have repeating titles'}
end
