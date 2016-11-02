class AuthenticateUser
  include Interactor

  OPTIONS = { store: false, scope: :user }

  delegate :warden, to: :context

  def call
    context.user = authenticated_user!
  end

  private

  def authenticated_user!
    warden.request.env["devise.skip_trackable"] = false
    warden.authenticate!(OPTIONS)
  end
end
