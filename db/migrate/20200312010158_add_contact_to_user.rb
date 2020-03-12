class AddContactToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :contact, :integer
  end
end
