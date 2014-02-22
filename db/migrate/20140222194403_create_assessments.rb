class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :name, :null => false
      t.integer :cohort_id, :null => false
      t.string :description
      t.datetime :start_time
      t.integer :duration
      t.integer :maximum_mark, :null => false

      t.timestamps
    end
  end
end
