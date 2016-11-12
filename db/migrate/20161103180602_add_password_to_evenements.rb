class AddPasswordToEvenements < ActiveRecord::Migration[5.0]
  def self.up
    add_column :evenements, :pwd, :string
  end

  def self.down
    remove_column :evenements, :pwd
  end
end

