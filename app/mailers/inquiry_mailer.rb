class InquiryMailer < ApplicationMailer
  default from: Rails.application.credentials.dig(:gmail, :username)

  def admin_notification(inquiry)
    @inquiry = inquiry

    mail(
      to: "shwetagogia60@gmail.com",
      subject: "New Inquiry Received - Medvix Website"
    )
  end

  def customer_confirmation(inquiry)
    @inquiry = inquiry

    mail(
      to: @inquiry.email,
      subject: "Thank you for contacting Medvix"
    )
  end
end
