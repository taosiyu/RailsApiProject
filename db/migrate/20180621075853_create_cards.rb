class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :detail
      t.text :content
      t.integer :clicks
      t.string :images
      t.string :cardtype
      t.binary :other
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :cards, [:user_id, :created_at]
  end
end
