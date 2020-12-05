class CreateAdmits < ActiveRecord::Migration[6.0]
  def change
    create_table :admits do |t|
      t.integer :prospect_id

      t.timestamps
    end
  end
end
