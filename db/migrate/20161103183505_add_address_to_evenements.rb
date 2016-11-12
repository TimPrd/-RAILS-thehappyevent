class AddAddressToEvenements < ActiveRecord::Migration[5.0]

  def self.up
    add_column :evenements, :address, :string
  end

  def self.down
    remove_column :evenements,:address
  end
end
