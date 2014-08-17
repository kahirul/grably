class UserSession < Authlogic::Session::Base
  find_by_login_method :login_finder

  def search_for_record(*args)
    User.send *args
  end
end
