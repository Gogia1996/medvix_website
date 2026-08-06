class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.order(created_at: :desc)

    if params[:search].present?
      @products = @products.where(
        "name ILIKE :query OR strength ILIKE :query OR dosage_form ILIKE :query OR segment ILIKE :query",
        query: "%#{params[:search]}%"
      )
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: "Product created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Product updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: "Product deleted successfully."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name,
      :slug,
      :strength,
      :dosage_form,
      :segment,
      :short_description,
      :description,
      :composition,
      :indications,
      :storage,
      :packaging,
      :featured,
      :image
    )
  end
end