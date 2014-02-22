class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.integer :submission_id
      t.string :body
      t.integer :start_pos
      t.integer :end_pos
      t.integer :user_id

      t.timestamps
    end
  end
end
