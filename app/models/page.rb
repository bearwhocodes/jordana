class Page < ApplicationRecord
  # Relationships
  has_many :page_elements
  accepts_nested_attributes_for :page_elements

  # Validation
  validates :slug, uniqueness: true

  # Helper Methods
  def home_page?
    slug == 'home'
  end

  def about_page?
    slug == 'about'
  end
end