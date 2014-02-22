class User < ActiveRecord::Base
  before_authentication :ensure_authentication_token

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?
  end

  def self.generate_authentication_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.authentication_token = User.generate_authentication_token
    self.save!
  end

  #returns either nil or user object
  def User.find_by_credentials(identifier, password)
    @user = (identifier.include?("@") ? User.find_by_email(identifier) : User.find_by_username(identifier))

    return nil if @user.nil?

    if @user.is_password?(password)
      @user
    else
      nil
    end
  end

  private

  def ensure_authentication_token
    self.authentication_token ||= User.generate_authentication_token
  end

end
