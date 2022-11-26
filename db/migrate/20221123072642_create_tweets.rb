class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :content, null: false
      t.integer :favorite_count
      t.integer :comment_count
      t.belongs_to :user

      t.timestamps
    end
  end
end
