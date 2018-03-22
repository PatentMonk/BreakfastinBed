module Api
  class BaseController < ActionController::API
    include Response
    include ExceptionHandler

    # called before every action on controllers
    before_action :authorize_request
    attr_reader :current_user

    private

    # Check for valid request token and return user
    def authorize_request
      @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end

    def current_restaurant
      @current_restaurant ||= Restaurant.find_by(uuid: params[:restaurant_id])
    end

    def current_order
      @current_order ||= Order.find_by(uuid: params[:order_id])
    end
  end
end
