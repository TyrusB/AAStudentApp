# == Schema Information
#
# Table name: daily_reports
#
#  id                      :integer          not null, primary key
#  week                    :integer
#  day                     :integer
#  finished_exercises      :boolean
#  read_solutions          :boolean
#  read_tomorrows_readings :boolean
#  rating_of_understanding :integer
#  easiest_concept         :string(255)
#  most_difficult_concept  :string(255)
#  pair_name               :string(255)
#  pair_rating             :integer
#  pair_comments           :text
#  daily_comments          :text
#  user_id                 :integer
#  created_at              :datetime
#  updated_at              :datetime
#

class DailyReport < ActiveRecord::Base
  validates :week, :day, :rating_of_understanding, :easiest_concept,
          :hardest_concept, :pair_name, :pair_rating, :pair_comments,
          :daily_comments, :user_id, presence: true

  validates :finished_exercises, :read_solutions, :read_tomorrows_readings,
            inclusion: { in: [true, false] }

  belongs_to :user

  has_many :report_comments, -> {order("created_at DESC")}

  def week_day
    "Week #{self.week}- Day #{self.day}"
  end


end
