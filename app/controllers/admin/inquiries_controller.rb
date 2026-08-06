class Admin::InquiriesController < Admin::BaseController
  before_action :set_inquiry, only: [:show, :destroy, :update_status]

  def index
    @inquiries = Inquiry.order(created_at: :desc)

    if params[:search].present?
      @inquiries = @inquiries.where(
        "name ILIKE :query OR email ILIKE :query OR subject ILIKE :query",
        query: "%#{params[:search]}%"
      )
    end
  end

  def show
  end

  def destroy
    @inquiry.destroy

    redirect_to admin_inquiries_path,
                notice: "Inquiry deleted successfully."
  end

  def update_status
    if @inquiry.update(status: params[:status])
      redirect_to admin_inquiries_path,
                  notice: "Inquiry status updated successfully."
    else
      redirect_to admin_inquiries_path,
                  alert: "Unable to update inquiry status."
    end
  end

  private

  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
  end
end
