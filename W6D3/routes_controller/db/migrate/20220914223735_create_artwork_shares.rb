class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.references :artwork, presence: true, foreign_key: true
      t.references :viewer, presece: true, foreign_key: {to_table: :users}
      
      t.timestamps
    end
  end
end
