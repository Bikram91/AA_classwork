# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :bigint           not null
#  author_id  :bigint           not null
#
# Indexes
#
#  index_comments_on_artwork_id  (artwork_id)
#  index_comments_on_author_id   (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (artwork_id => artworks.id)
#  fk_rails_...  (author_id => users.id)
#
class Comment < ApplicationRecord

    belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

    belongs_to :author,
    foreign_key: :author_id,
    class_name: :User


    def self.comments_for_user_id(user_id)
        Comment
        .joins(:author)
        .where(author_id: {id: user_id})
    end


end
