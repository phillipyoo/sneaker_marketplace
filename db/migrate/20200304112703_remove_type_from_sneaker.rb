class RemoveTypeFromSneaker < ActiveRecord::Migration[5.2]
  def change
    remove_column :sneakers, :type, :string
  end
end
