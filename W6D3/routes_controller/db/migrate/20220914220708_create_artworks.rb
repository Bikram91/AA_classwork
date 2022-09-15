class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, presence: true 
      t.string :image_url, presence: true
      t.references :artist, presence: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
