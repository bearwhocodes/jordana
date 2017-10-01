class EnquiryMailer < ApplicationMailer
  default from: 'notifications@example.com'
  
  def thank_you_email(enquiry)
    @enquiry = enquiry
    mail(to: @enquiry.email, subject: 'Thank you for getting in touch')
  end

  def admin_email(enquiry)
    @enquiry = enquiry
    mail(to: ENV['JORDANA_EMAIL'], subject: 'New enquiry received')
  end
end
