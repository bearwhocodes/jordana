class PageElement < ApplicationRecord
  # Includes
  include Bootsy::Container

  # Relationships
  belongs_to :page

  # Validation
  validates_presence_of :slug, :html

end