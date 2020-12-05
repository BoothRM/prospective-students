class CreateProspects < ActiveRecord::Migration[6.0]
  def change
    create_table :prospects do |t|
      t.integer :user_id
      t.string :country
      t.string :round
      t.string :details
      t.string :contact
      t.string :status

      t.timestamps
    end
  end
end
