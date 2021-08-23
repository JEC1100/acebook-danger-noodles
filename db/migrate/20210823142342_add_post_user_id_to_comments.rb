class AddPostUserIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :users_id, :integer
    add_index :comments, :users_id
    add_column :comments, :posts_id, :integer
    add_index :comments, :posts_id
  end
end
