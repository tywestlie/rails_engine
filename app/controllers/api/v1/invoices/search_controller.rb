class Api::V1::Invoices::SearchController < ApplicationController
   def show
    render json: Invoice.find_by(search_params)
  end

  def index
    render json: Invoice.where(search_params)
  end

  private
    def search_params
      params.permit(:status, :customer_id, :merchant_id, :id,  :created_at, :updated_at)
    end
end