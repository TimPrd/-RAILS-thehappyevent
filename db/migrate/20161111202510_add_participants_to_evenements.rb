class AddParticipantsToEvenements < ActiveRecord::Migration[5.0]
  def change
    add_column :evenements, :participants, :text, default: [], array:true
  end
end
