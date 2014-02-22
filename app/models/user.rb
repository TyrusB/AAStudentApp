class User < ActiveRecord::Base
  before_validation :ensure_session_token

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
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
    @user = (identifier.include?("@") ? User.find_by_email(identifier) : User.find_by_username(identifier))

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
