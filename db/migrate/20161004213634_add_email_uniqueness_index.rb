#Ce code utilise une méthode Rails appelée add_index pour ajouter l'index sur la colonne email
# de la table users. L'index par lui-même ne contraint pas l'unicité, mais c'est l'option
# :unique => true qui le fait.
class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :users, :email, :unique => true
  end

  def self.down
    remove_index :users, :email
  end
end