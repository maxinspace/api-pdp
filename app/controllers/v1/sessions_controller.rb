module V1
  class SessionsController < Devise::SessionsController
    wrap_parameters :user

    def create
      user = AuthenticateUser.call(warden: warden).user
      respond_with(user, serializer: SessionSerializer)
    end

    def destroy
      current_user.update_attribute(:authentication_token, nil)
      respond_with current_user, status: :ok
    end
  end
end
