class Submission < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :student
end
