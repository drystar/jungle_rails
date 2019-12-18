class User < ActiveRecord::Base
  has_secure_password

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, confirmation: true, length: {within: 6..40}
  validates :email, presence: true, :uniqueness => {:case_sensitive => true}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    user.authenticate(password) ? user : nil;
  end


end

