class AddBlockToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :block, :boolean
  end
end
