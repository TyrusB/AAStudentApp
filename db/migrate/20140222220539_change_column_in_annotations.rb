class ChangeColumnInAnnotations < ActiveRecord::Migration
  def change
    rename_column :annotations, :submission_id, :source_file_id
  end
end
