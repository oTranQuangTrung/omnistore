class CustomersController < ApplicationController
  before_action :load_customer, only: [:edit, :update]
  layout false, only: [:show, :edit, :update]

  def show
    @customer = Shops::RetrieveCustomerService.new(current_shop).execute params[:psid]
  end

  def edit
    @provinces = Province.pluck :name, :id
    @districts = District.pluck :name, :id
    @customer.build_customer_address
  end

  def update
    binding.pry
    @customer.update_attributes customer_params
  end

  private
  def customer_params
    params.require(:customer).permit :name, :email, :phone_number, :address, customer_address_attributes: [:id, :province_id, :district_id]
  end

  def load_customer
    @customer = Customer.find params[:id]
  end
end
