class User < ActiveRecord::Base

  def self.is_user_logged_in(session_variable)
    if session_variable == nil
      return false
    else
      return true
    end
  end

end