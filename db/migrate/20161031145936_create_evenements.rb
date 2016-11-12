class CreateEvenements < ActiveRecord::Migration[5.0]
  serialize :participants, Array
  def change
    create_table :evenements do |t|
      t.string :adresse
      t.integer :numero
      t.string :route
      t.integer :zipCode
      t.string :ville
      t.string :pays
      t.string :pays
      t.float :latitude
      t.float :longitude
      t.boolean :isPrivate
      t.integer :userId
      t.integer :participants, default: [].to_yaml
      t.timestamps
    end
  end

  def self.down
    drop_table :evenements
  end
end
