class Enquiry < ApplicationRecord
  # Constants
  MESSAGE_TYPES = [
    ['Please select', nil],
    ['Just say hello', 'message'],
    ['Talk about a project', 'project']
  ]

  # Validation
  validates :name, presence: { message: "Name has to be filled out" }
  validates :email, presence: { message: "Email has to be filled out" }
  validates :message_type, presence: { message: "Please choose an option" }
  validates_presence_of :message, message: "Message has to be filled out", :if => :message_enquiry?
  validates_presence_of :project_description, message: "Project Description has to be filled out", :if => :project_enquiry?
  validates_presence_of :project_budget, message: "Please choose a budget", :if => :project_enquiry?
  validates_format_of :email, with: Devise::email_regexp, message: "Email is not the right format"

  # Scopes
  default_scope { order(created_at: :desc) }
  scope :messages, -> { where(message_type: 'message') }
  scope :projects, -> { where(message_type: 'project') }

  # Callbacks
  after_create :send_emails

  # Helper Methods
  def message_enquiry?
    message_type == 'message'
  end

  def project_enquiry?
    message_type == 'project'
  end

  # Decorator Methods
  def decorated_message_type
    message_type.capitalize
  end

  def budget
    "£" + project_budget
  end

private

  def send_emails
    # Send emails once saved
    EnquiryMailer.thank_you_email(self).deliver_later
    EnquiryMailer.admin_email(self).deliver_later
  end
end
