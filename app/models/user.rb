class User < ActiveRecord::Base
  has_secure_password
  has_many :restaurants, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true, format: /\A\S+\z/
  validates :email, presence: true,
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8, allow_blank: true }

  before_save :format_username
  before_save :format_email

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end #authenticate

  def to_param
    username
  end

  def format_username
    self.username = username.downcase
  end #format_username

  def format_email
    self.email = email.downcase 
  end #format_email

  def gravatar_id 
    Digest::MD5::hexdigest(email.downcase)
  end #gravatar_id

end #User

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean          default(FALSE)
#  username        :string
#
