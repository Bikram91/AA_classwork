class UpdateUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, presence: true, uniqueness: true
  end
end
