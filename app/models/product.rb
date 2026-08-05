class Product < ApplicationRecord
  has_one_attached :image

  before_validation :generate_slug

  validates :name, presence: true
  validates :slug, uniqueness: true

  scope :featured, -> { where(featured: true) }

  private

  def generate_slug
    self.slug = name.to_s.parameterize if name.present?
  end
end
