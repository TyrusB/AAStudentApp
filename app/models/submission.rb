class Submission < ActiveRecord::Base
  validates :assessment_id, :user_id, presence: true

  belongs_to :assessment
  belongs_to :student, :class_name => "User"

  has_many :source_files
  has_many :annotations, :through => :source_files, :source => :annotations

  def annotations_json
    self.annotations.map(&:to_json)
  end
end
