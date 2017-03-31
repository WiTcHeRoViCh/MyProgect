class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string  :sender
      t.string  :body
      t.belongs_to :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
