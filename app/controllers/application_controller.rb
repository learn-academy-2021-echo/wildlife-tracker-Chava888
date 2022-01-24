class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    # def render_unprocessable_entity_response(exception)
    #     render json: exception.record.errors, status: :unprocessable_entity
    # end
    # def render_unprocessable_entity_response(exception)
    #     render json: {
    #       message: "Validation Failed",
    #       errors: ValidationErrorsSerializer.new(exception.record).serialize
    #     }, status: :unprocessable_entity
    # end
end
