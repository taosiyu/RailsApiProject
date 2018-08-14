class CreateDcomments < ActiveRecord::Migration[5.2]
  def change
    create_table :dcomments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :discovery, foreign_key: true

      t.timestamps
    end
    add_index :cards, [:user_id, :discovery_id]
  end
end
