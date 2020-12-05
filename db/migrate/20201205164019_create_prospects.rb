class CreateProspects < ActiveRecord::Migration[6.0]
  def change
    create_table :prospects do |t|
      t.integer :user_id
      t.string :name
      t.string :country
      t.string :round
      t.string :contact
      t.string :status
      t.text :details

      t.timestamps
    end
  end
end
