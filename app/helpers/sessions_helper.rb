module SessionsHelper
  def current_user
    if session[:remember_token] == nil
      return nil
    else
      return User.find(session[:remember_token])
    end
  end

  def current_user?
    if current_user != nil
      return true
    else
      return false
    end
  end

  def authenticate_user
    if !current_user?
      redirect_to login_path
    end
  end

end
