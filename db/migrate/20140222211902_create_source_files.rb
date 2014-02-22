class CreateSourceFiles < ActiveRecord::Migration
  def change
    create_table :source_files do |t|
      t.string :file_path, null: false
      t.string :body, null: false
      t.integer :submission_id, null: false

      t.timestamps
    end
  end
end
