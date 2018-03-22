module Api
  module V1
    class DescriptionsController < ::Api::BaseController
      before_action :set_description, only: [:show, :edit, :update, :destroy]

      # GET /descriptions/1
      # GET /descriptions/1.json
      def show
        json_response(@description)
      end

      # GET /descriptions/new
      def new
        json_response(Description.new)
      end

      # GET /descriptions/1/edit
      def edit
        json_response(@description)
      end

      # POST /descriptions
      # POST /descriptions.json
      def create
        json_response(Description.create!(description_params), :created)
      end

      # PATCH/PUT /descriptions/1
      # PATCH/PUT /descriptions/1.json
      def update
        json_response(@description.update!(description_params))
      end

      # DELETE /descriptions/1
      # DELETE /descriptions/1.json
      def destroy
        @description.destroy!
        head :no_content
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_description
          @description = Description.find_by(uuid: params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def description_params
          params.require(:description).permit(:content)
        end
    end
  end
end
