class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def create
    respond_with Item.create(item_params)
  end

  def update
    respond_with Item.update(params[:id], item_params)
  end

  def destroy
    respond_with Item.destroy(params[:id])
  end

private

  def item_params
    params.require(:item).permit(:name, :description)
  end

  def authenticate_for_api
    authenticate_or_request_with_http_basic("Please authenticate to use api") do |email, password|
      user = User.find_by(email: email)
      return true if user && user.authenticate(password)
      head :unauthorized
    end
  end
end
