class AddParentToComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.integer :parent_id
      t.integer :reply_to
    end
    add_foreign_key(:comments, :comments, column: 'parent_id')
    add_foreign_key(:comments, :comments, column: 'reply_to')
  end
end
