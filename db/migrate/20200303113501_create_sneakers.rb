class CreateSneakers < ActiveRecord::Migration[5.2]
  def change
    create_table :sneakers do |t|
      t.string :model
      t.decimal :size, precision: 2, scale: 2
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
