class ReportComment < ActiveRecord::Base
  validates :ta_id, :daily_report_id, :body, presence: true

  belongs_to :daily_report
  belongs_to :ta, :class_name => "User", :foreign_key => :ta_id
end
