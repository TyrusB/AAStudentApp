class Assessment < ActiveRecord::Base
  belongs_to :cohort
  has_many :submissions

  validates :name, :maximum_mark, :presence => true

  def zip_path
    "uploads/#{self.name}.zip"
  end
end
