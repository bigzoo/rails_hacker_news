class ChangePostsVotesDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:posts, :votes, 0)
  end
end
