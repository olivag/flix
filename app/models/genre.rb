class Genre < ApplicationRecord
  before_validation :generate_slug
  
  validates :name, :slug, presence: true, uniqueness: true

  has_many :characterizations, dependent: :destroy
  has_many :movies, through: :characterizations

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize if name
  end
end
