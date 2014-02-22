class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :annotation_id
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
