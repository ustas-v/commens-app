class CreateOauths < ActiveRecord::Migration[5.0]
  def change
    create_table :oauths do |t|
      t.references :user
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps
    end

    add_index :oauths, [:provider, :uid], unique: true
  end
end
