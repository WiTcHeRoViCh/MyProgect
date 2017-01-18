class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
    	t.string :gender
    	t.string :country
    	t.string :birthday
    	t.text :about
    	t.integer :user_id

      t.timestamps
    end
  end
end
