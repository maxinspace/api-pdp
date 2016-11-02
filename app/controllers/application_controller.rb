class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  acts_as_token_authentication_handler_for User, fallback: :exception

  respond_to :json
end
