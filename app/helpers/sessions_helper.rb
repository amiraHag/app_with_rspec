module SessionsHelper
  
  def sign_in(user)
    cookies[:remember_token] = { value:   user.remember_token,
                             expires: 20.years.from_now.utc }
    self.current_user = user
  end  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end
  def current_user
   @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
 def sign_out
   cookies.delete(:remember_token)
    self.current_user = nil
    
  end
end
