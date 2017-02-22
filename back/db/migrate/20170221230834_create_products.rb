class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :image_url
      t.integer :price
      t.integer :brand_id
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
