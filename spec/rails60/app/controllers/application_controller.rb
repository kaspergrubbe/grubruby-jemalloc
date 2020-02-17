class ApplicationController < ActionController::Base
  def hello
    render json: {
      message: "Hi!",
      environment: ENV,
    }
  end
end
