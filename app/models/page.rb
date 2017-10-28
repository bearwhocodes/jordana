class Page < ApplicationRecord
  # Includes
  include Bootsy::Container

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