class InquiriesController < ApplicationController
  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      InquiryMailer.admin_notification(@inquiry).deliver_later
      InquiryMailer.customer_confirmation(@inquiry).deliver_later

      flash.now[:notice] = "Thank you! Your inquiry has been submitted."
    else
      flash.now[:alert] = @inquiry.errors.full_messages.to_sentence
    end

    respond_to do |format|
      format.turbo_stream
      format.html do
        if @inquiry.persisted?
          redirect_to root_path(anchor: "contact"),
                      notice: "Thank you! Your inquiry has been submitted."
        else
          redirect_to root_path(anchor: "contact"),
                      alert: @inquiry.errors.full_messages.to_sentence
        end
      end
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(
      :name,
      :email,
      :phone,
      :company,
      :subject,
      :message
    )
  end
end
