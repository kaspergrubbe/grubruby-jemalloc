class ApplicationController < ActionController::Base
  def hello
    render plain: "Hi!"
  end
end
