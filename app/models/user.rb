class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  before_create :create_remember_token
  has_many :relationships
  has_many :books, through: :relationships
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: { minimum: 6 }


  def User.new_remember_token
    SecureRandom.urlsafe_base64


  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end



end
