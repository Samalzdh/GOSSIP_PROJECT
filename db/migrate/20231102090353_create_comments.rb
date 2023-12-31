class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :comments, :user_id
  end
end
