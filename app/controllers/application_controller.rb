class ApplicationController < ActionController::API

def current_user
    @current_user ||= authenticate
  end

  private
    def authenticate
      user = User.find_by(token: request.headers['X-AUTH-TOKEN'])
      head :unauthorized unless user
      user
    end

end
