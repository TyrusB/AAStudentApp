class Annotation < ActiveRecord::Base
  validates :source_file_id, :body, :start_pos, :end_pos, :user_id, :presence => true
  belongs_to :source_file
end
