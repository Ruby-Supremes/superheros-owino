class PowersController < ApplicationController
  
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Power.all
    end

    def show
        power = Power.find(params[:id])
        render json: power, status: :ok
    end

    def update
        power = Power.find_by(id: params[:id])
        power.update!(power_params)
        render json: power, status: :ok
    end

    private

    def render_not_found_response
        render json: { error: "Power not found" }, status: :not_found
      end

     

      def power_params
        params.permit(:description)
      end
end
