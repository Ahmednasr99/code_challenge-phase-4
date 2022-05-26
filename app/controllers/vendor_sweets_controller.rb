class VendorSweetsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response



    def create
        vendor_sweet = VendorSweet.create!(vendor_sweet_params)
        render json: vendor_sweet, serializer: CreateVendorSweetSerializer, status: :created
    end


    def destroy
        vendor_sweet = find_vendor_sweet
        vendor_sweet.destroy
        head :no_content
    end





    private


    def find_vendor_sweet
        VendorSweet.find(params[:id])
      end

    def vendor_sweet_params
        params.permit(:vendor_id, :vendor_id, :price, :name)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "VendorSweett not found" }, status: :not_found
      end
end
