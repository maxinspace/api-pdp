module V1
  class RegistrationsController < Devise::SessionsController
    wrap_parameters :user

    def create
      user = CreateUser.call(warden: warden, params: params).user
      respond_with(user, serializer: SessionSerializer)
    end
  end
end
