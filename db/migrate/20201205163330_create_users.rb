class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :year
      t.string :country
      t.text :ask_me_about
      t.integer :prospects_count, { :default => 0 }

      t.timestamps
    end
  end
end
