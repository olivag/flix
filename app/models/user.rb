class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie

  has_secure_password

  validates :name,  presence: true
  validates :email, presence: true, 
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8, allow_blank: true }
  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      format: /\A[A-Z0-9]+\z/i

  scope :by_name, ->    { order(name: :asc) }
  scope :not_admins, -> { by_name.where(admin: false) }

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end                      

  def self.authenticate(email, username, password)
    user = User.find_by(email: email) || User.find_by(username: username)
    user && user.authenticate(password)
  end

  def to_param
    username
  end
end
