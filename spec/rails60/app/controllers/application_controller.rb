class ApplicationController < ActionController::Base
  def hello
    miniracer_context = MiniRacer::Context.new
    miniracer_context.eval "var adder = (a,b)=>a+b;"

    render json: {
      message: "Hi!",
      environment: ENV,
      javascript: miniracer_context.eval("adder(20,22)"),
    }
  end
end
