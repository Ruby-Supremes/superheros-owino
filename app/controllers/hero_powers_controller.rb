class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def create
        # create! exceptions will be handled by the rescue_from ActiveRecord::RecordInvalid code
        hero_power = HeroPower.create!(hero_power_params)
        render json: Hero.find(params[:hero_id]), status: :created
        # render json: hero_power, status: :created
    end


  private

  def hero_power_params
    params.permit(:strength, :hero_id, :power_id)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end
