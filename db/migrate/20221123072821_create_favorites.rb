class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.belongs_to :user
      t.bigint :favoriteable_id
      t.string :favoriteable_type

      t.timestamps
    end
    add_index :favorites, [:favoriteable_type, :favoriteable_id]
  end
end
