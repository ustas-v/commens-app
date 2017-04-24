class AddColumnParentToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :parent_id, :integer, null: true, default: nil
    add_index :comments, :parent_id
  end
end
