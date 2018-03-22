module Api
  module V1
    class RestaurantFoodItemsController < ::Api::BaseController
      before_action :set_food_item, only: [:show, :edit, :update, :destroy]
      before_action :set_attributes, only: [:create, :update]

      # GET /food_items
      # GET /food_items.json
      def index
        json_response(current_restaurant.restaurant_food_items)
      end

      # GET /food_items/1
      # GET /food_items/1.json
      def show
        json_response(@food_item)
      end

      # GET /food_items/new
      def new
        json_response(current_restaurant.restaurant_food_items.new)
      end

      # GET /food_items/1/edit
      def edit
        json_response(@food_item)
      end

      # POST /food_items
      # POST /food_items.json
      def create
        json_response(current_restaurant.restaurant_food_items.create!(food_item_params), :created)
      end

      # PATCH/PUT /food_items/1
      # PATCH/PUT /food_items/1.json
      def update
        json_response(@food_item.update!(food_item_params))
      end

      # DELETE /food_items/1
      # DELETE /food_items/1.json
      def destroy
        @food_item.destroy!
        head :no_content
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_food_item
          @food_item = current_restaurant.restaurant_food_items.find_by(uuid: params[:id])
        end

        def set_attributes
          if food_item_params[:description_attributes] && food_item_params[:description_attributes][:id]
            food_item_params[:description_attributes][:id] = Description.find_by(uuid: food_item_params[:description_attributes][:id]).id
          end
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def food_item_params
          params.require(:restaurant_food_item).permit(:name, :price, :image_url, description_attributes: [:id, :content, :_destroy])
        end
    end
  end
end
