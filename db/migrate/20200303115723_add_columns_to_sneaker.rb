class AddColumnsToSneaker < ActiveRecord::Migration[5.2]
  def change
    add_column :sneakers, :brand, :string
    add_column :sneakers, :type, :string
  end
end
