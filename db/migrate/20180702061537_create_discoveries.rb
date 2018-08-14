class CreateDiscoveries < ActiveRecord::Migration[5.2]
  def change
    create_table :discoveries do |t|
      t.string :title
      t.text :content
      t.integer :dtype
      t.string :image

      t.timestamps
    end
  end
end
