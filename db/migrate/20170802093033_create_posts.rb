class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :link
      t.integer :votes
      t.float :ranking
      t.text :description

      t.timestamps
    end
  end
end
