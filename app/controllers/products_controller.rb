class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to @product
    else
      flash.now[:alert] = 'There was an error creating the product.'
      render :new
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if @product.update(product_params)
      flash[:notice] = 'Product was successfully updated.'
      redirect_to @product
    else
      flash.now[:alert] = 'There was an error updating the product.'
      render :edit
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    flash[:alert] = 'Product was successfully destroyed.'
    redirect_to products_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :currency)
    end
end
