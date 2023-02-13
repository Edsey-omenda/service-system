class AccountsController < ApplicationController

    # skip_before_action :verify_authenticity_token, only [:index, :create]

    def index
        @accounts = Account.all

        render json: @accounts
    end

    def show
        @account = Account.find(params[:id])

        render json: @account
    end

    def create
        @account = Account.create(account_params)
        
        render json:  @account
    end

    #Updates the account upon withdrawal or topups by focusing on the amount attribute
    def update
        @account = Account.find(params[:id])
        @account.update(amount_params)

        render json: "#{@account.customer_name} Your account has been updated!"
        #render json: @account
    end

    private

    def account_params
        params.permit( :customer_id, :account_number, :customer_name, :debit_Cnumber, :credit_Cnumber, :account_type, :amount)
    end

    def amount_params
        params.permit(:amount)
    end
end
