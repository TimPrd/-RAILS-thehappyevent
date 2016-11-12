class AddDateToEvenements < ActiveRecord::Migration[5.0]

  def self.up
    add_column :evenements, :datee, :date
  end

  def self.down
    remove_column :evenements,:datee
  end
end
