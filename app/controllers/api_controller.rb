class ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate
  include Pundit

  rescue_from ActiveRecord::RecordInvalid, with: :validation_errors
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :bad_request
  before_action :set_locale

  private

  def set_locale
    I18n.locale = current_user.locale
  end

  def not_found
    render json: { description: 'NOT_FOUND',
                   message: "record with id #{params[:id]} was not found" },
           status: :not_found
  end

  def validation_errors
    render json: { description: 'VALIDATION_ERROR',
                   message: 'request params did not match validations' },
           status: :internal_server_error
  end

  def bad_request
    render json: { description: 'BAD_REQUEST',
                   message: 'a required parameter is missing' },
           status: :forbidden
  end
end
