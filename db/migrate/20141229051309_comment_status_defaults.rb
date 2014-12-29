class CommentStatusDefaults < ActiveRecord::Migration
  def change
    change_column :comments, :status, :integer, null: false, default: 0
    change_column :comments, :body, :text, null: false
    add_index :comments, :title
  end
end
