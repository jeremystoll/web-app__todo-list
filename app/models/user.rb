class User < ActiveRecord::Base

  def self.is_user_logged_in
    binding.pry
    if session[:user_id] == nil
      binding.pry
      return false
      binding.pry
    else
      binding.pry
      return session[:user_id]
    end
  end

end