class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :gender
      t.string :phone
      t.string :email
      t.string :image

      t.timestamps
    end
  end
end
