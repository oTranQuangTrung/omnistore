class CustomersController < ApplicationController
  before_action :load_customer, only: [:edit, :update]
  layout false, only: [:show, :edit, :update]

  def show
    @customer = Facebook::RetrieveShopCustomer.call current_shop, params[:psid]
  end

  def edit
  end

  def update
    @customer.update_attributes customer_params
  end

  private
  def customer_params
    params.require(:customer).permit :name, :email, :phone_number, :address
  end

  def load_customer
    @customer = Customer.find params[:id]
  end
end
