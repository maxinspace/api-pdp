class CreateUser
  include Interactor

  delegate :warden, :params, to: :context

  def call
    create_user

    context.user = authenticate_user!
  end

  private

  def create_user
    user = User.new(user_params)

    context.fail! unless user.save
  end

  def authenticate_user!
    AuthenticateUser.call(warden: warden).user
  end

  def user_params
    {
      name: params["name"],
      email: params["email"],
      password: params["password"],
      password_confirmation: params["passwordConfirmation"]
    }
  end
end
