class CreateDailyReports < ActiveRecord::Migration
  def change
    create_table :daily_reports do |t|
      t.integer :week
      t.integer :day
      t.boolean :finished_exercises
      t.boolean :read_solutions
      t.boolean :read_tomorrows_readings
      t.integer :rating_of_understanding
      t.string :easiest_concept
      t.string :hardest_concept
      t.string :pair_name
      t.integer :pair_rating
      t.text :pair_comments
      t.text :daily_comments

      t.integer :user_id

      t.timestamps
    end

    add_index :daily_reports, :week
    add_index :daily_reports, :day
    add_index :daily_reports, :user_id
    add_index :daily_reports, [:week, :day, :user_id], unique: true
  end
end
