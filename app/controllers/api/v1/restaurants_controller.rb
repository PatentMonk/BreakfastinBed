module Api
  module V1
    class RestaurantsController < ::Api::BaseController
      before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

      # GET /restaurants
      # GET /restaurants.json
      def index
        json_response(Restaurant.all)
      end

      # GET /restaurants/1
      # GET /restaurants/1.json
      def show
        json_response(@restaurant)
      end

      # GET /restaurants/new
      def new
        json_response(Restaurant.new)
      end

      # GET /restaurants/1/edit
      def edit
        json_response(@restaurant)
      end

      # POST /restaurants
      # POST /restaurants.json
      def create
        json_response(Restaurant.create!(restaurant_params), :created)
      end

      # PATCH/PUT /restaurants/1
      # PATCH/PUT /restaurants/1.json
      def update
        json_response(@restaurant.update!(restaurant_params), :updated)
      end

      # DELETE /restaurants/1
      # DELETE /restaurants/1.json
      def destroy
        @restaurant.destroy!
        head :no_content
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_restaurant
          @restaurant = Restaurant.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def restaurant_params
          params.require(:restaurant).permit(:name, :address_id, :food_type)
        end
    end
  end
end

