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
  validates :week, :day, :finished_exercises, :read_tomorrows_readings,
    :rating_of_understanding, :pair_name, :pair_rating, :user_id, :daily_comments,
    presence: true

  belongs_to :user


end