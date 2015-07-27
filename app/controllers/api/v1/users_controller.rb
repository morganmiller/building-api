class Api::V1::UsersController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with User.all
  end
end
