class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.integer :evenementId
      t.integer :userId
      t.string :status

      t.timestamps
    end
  end
end
