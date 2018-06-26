class Api::V1::Merchants::SearchController < ApplicationController
  def show
    render json: Merchant.find_by(search_params)
  end

  private
  def search_params
    params.permit(:name, :id, :created_at, :updated_at)
  end
end
