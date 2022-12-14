class HerosController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Hero.all, status: :ok
    end

    def show
        hero = Hero.find(params[:id])
        render json: hero, serializer: HeroAndPowerSerializer, status: :ok
    end

    def destroy
        hero = Hero.find(params[:id])
        hero.destroy
    end

    private 

    def render_not_found_response
        render json: { error: "Hero not found" }, status: :not_found
      end
end
