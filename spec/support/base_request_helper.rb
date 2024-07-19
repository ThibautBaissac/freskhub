module BaseRequestHelper
  def sign_in_as(user)
    post(auth_session_path, params: {email: user.email, password: user.password})
  end
end
