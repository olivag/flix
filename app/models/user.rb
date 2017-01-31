class User < ApplicationRecord
  has_secure_password

  validates :name,  presence: true
  validates :email, presence: true, 
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8, allow_blank: true }
  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      format: /\A[A-Z0-9]+\z/i

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end                      

end
