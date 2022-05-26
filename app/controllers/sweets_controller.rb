class SweetsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        sweet = Sweet.all
        render json: sweet
    end
    

    def show
        sweet = find_sweet
        render json: sweet
    end


    private

    def find_sweet
        Sweet.find(params[:id])
    end


    def render_not_found_response
        render json: { error: "Sweet not found" }, status: :not_found
    end


    
    
    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
