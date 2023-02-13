class CustomersController < ApplicationController
    def index
        @customers = Customer.all

        render json: @customers
    end

    def show
        @customers = Customer.find(params[:id])

        render json: @customers
    end

    def create
        @customer = Customer.create(customer_params)
        
        render json: @customer
    end

    def update
        @customer = Customer.find(params[:id])
        @customer.update(customer_params)

        render json: @customer
    end

    private

    def customer_params
        params.permit(:name, :account_type, :account_number, :email, :age, :contact)
    end

end
