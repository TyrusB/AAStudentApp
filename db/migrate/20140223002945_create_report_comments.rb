class CreateReportComments < ActiveRecord::Migration
  def change
    create_table :report_comments do |t|
      t.text :body, null: false

      t.integer :daily_report_id, null: false
      t.integer :ta_id, null: false

      t.timestamps
    end

    add_index :report_comments, :ta_id
    add_index :report_comments, :daily_report_id
  end
end
