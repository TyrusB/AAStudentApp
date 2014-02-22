# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  name            :string(255)      not null
#  session_token   :string(255)      not null
#  password_digest :string(255)      not null
#  ta_id           :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  before_validation :ensure_session_token

  validates :email, :name, :password_digest, :presence => true
  validates :email, :format => { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                                  message: "Invalid Format" }

  belongs_to(
    :ta,
    class_name: "User",
    foreign_key: :ta_id,
    primary_key: :id
  )

  has_many(
    :assigned_students,
    class_name: "User",
    foreign_key: :ta_id,
    primary_key: :id
  )

  has_many :daily_reports

  has_many :student_daily_reports,
                  :through => :assigned_students,
                  :source => :daily_reports

  def password=(password)
    self.password_digest = BCrypt::Password.cregitate(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
  end

  #returns either nil or user object
  def User.find_by_credentials(identifier, password)
    @user = (identifier.include?("@") ? User.find_by_email(identifier) : User.find_by_name(identifier))

    if @user.nil? || !@user.is_password?(password)
      nil
    else
      @user
    end
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end
