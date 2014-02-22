class SourceFile < ActiveRecord::Base
  validates :submission_id, :body, :file_path, presence: true

  belongs_to :submission
  has_many :annotations

  def sanitized_file_path
    self.file_path.gsub("/","-").gsub(".","-")
  end

end
