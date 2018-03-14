module Api
  module V1
    class UsersController < ::Api::BaseController
      skip_before_action :authorize_request, only: :create

      # POST /signup
      # return authenticated token upon signup
      def create
        user = User.create!(user_params)
        response = { message: Message.account_created }
        json_response(response, :created)
      end

      def show
        json_response(current_user)
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :type)
      end
    end
  end
end