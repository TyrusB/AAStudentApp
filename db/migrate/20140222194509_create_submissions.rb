class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :assessment_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
