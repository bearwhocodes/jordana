class Enquiry < ApplicationRecord
  # Constants
  MESSAGE_TYPES = [
    ['Please select', nil],
    ['Just say hello', 'message'],
    ['Talk about a project', 'project']
  ]

  # Validation
  validates :name, :email, :message_type, presence: true
  validates_presence_of :message, :if => :message_enquiry?
  validates_presence_of :project_description, :project_budget, :if => :project_enquiry?
  validates_format_of :email, with: Devise::email_regexp

  # Scopes
  scope :messages, -> { where(message_type: 'message') }
  scope :projects, -> { where(message_type: 'project') }

  def message_enquiry?
    message_type == 'message'
  end

  def project_enquiry?
    message_type == 'project'
  end
end
