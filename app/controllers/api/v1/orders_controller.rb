module Api
  module V1
    class OrdersController < ::Api::BaseController
      before_action :set_order, only: [:show, :edit, :update, :destroy]
      before_action :set_attributes, only: [:create, :update]

      # GET /orders
      # GET /orders.json
      def index
        json_response(current_user.orders)
      end

      # GET /orders/1
      # GET /orders/1.json
      def show
        json_response(@order)
      end

      # GET /orders/new
      def new
        json_response(current_user.orders.new)
      end

      # GET /orders/1/edit
      def edit
        json_response(@order)
      end

      # POST /orders
      # POST /orders.json
      def create
        json_response(current_user.orders.create!(order_params), :created)
      end

      # PATCH/PUT /orders/1
      # PATCH/PUT /orders/1.json
      def update
        json_response(@order.update!(order_params))
      end

      # DELETE /orders/1
      # DELETE /orders/1.json
      def destroy
        @order.destroy!
        head :no_content
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
          @order = current_user.orders.find_by(uuid: params[:id])
        end

        def set_attributes
          if order_params[:payment_attributes] && order_params[:payment_attributes][:id]
            order_params[:payment_attributes][:id] = Payment.find_by(uuid: order_params[:payment_attributes][:id]).id
          end
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def order_params
          params.require(:order).permit(:purchaser_id, :restaurant_id, payment_attributes: [:id, :credit_card_id])
        end
    end
  end
end
