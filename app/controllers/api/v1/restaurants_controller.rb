module Api
  module V1
    class RestaurantsController < ::Api::BaseController
      before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
      before_action :set_attributes, only: [:create, :update]

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
        json_response(@restaurant.update!(restaurant_params))
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
          @restaurant = Restaurant.find_by(uuid: params[:id])
        end

        def set_attributes
          { description_attributes: Description, address_attributes: Address, schedule_attributes: Schedule }.each do |key, value|
            if restaurant_params[key] && restaurant_params[key][:id]
              restaurant_params[key][:id] = value.find_by(uuid: restaurant_params[key][:id]).id
            end
          end
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def restaurant_params
          params.require(:restaurant).permit(:name, :food_type,
                                              description_attributes: [:id, :content, :_destroy],
                                              address_attributes: [:id, :address_one, :address_two, :city, :state, :postal, :_destroy],
                                              schedule_attributes: [
                                                :id, :monday_opens_at, :monday_closes_at, :tuesday_opens_at, :tuesday_closes_at,
                                                :wednesday_opens_at, :wednesday_closes_at, :thursday_opens_at,
                                                :thursday_closes_at, :friday_opens_at, :friday_closes_at, :saturday_opens_at,
                                                :saturday_closes_at, :sunday_opens_at, :sunday_closes_at, :_destroy
                                              ]
                                            )
        end
    end
  end
end

