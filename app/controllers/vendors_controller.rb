class VendorsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        vendor = Vendor.all
        render json: vendor
    end

    def show
        vendor = find_vendor
        render json: vendor, serializer: VendorSweetIdSerializer
    end





    private

    def find_vendor
        Vendor.find(params[:id])
    end


    def vendor_params
        params.permit(:name)
    end
      

    
    def render_not_found_response
        render json: { error: "Vendor not found" }, status: :not_found
    end


    
    
    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    


end
