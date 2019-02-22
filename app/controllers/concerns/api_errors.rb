module ApiErrors
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError do |e|
      case e
      when ActionController::ParameterMissing
        render_parameter_missing_error(e)
      when Pundit::NotAuthorizedError
        render_not_authorized_error(e)
      when ActiveRecord::RecordNotFound
        render_record_not_found_error(e)
      else
        raise if Rails.env.development? || Rails.env.test?
        render_internal_server_error
      end
    end
    helper_method :authenticate_user!
  end

  def authenticate_user!
    render_authentication_error unless current_user
  end

  def render_internal_server_error
    render_error Api::Error.new(:internal_server_error), 500
  end

  def render_authentication_error
    render_error Api::Error.new(:not_authenticated), 401
  end

  def render_parameter_missing_error(e)
    render_error(Api::Error.new(:parameter_missing, param: e.param), 400)
  end

  def render_not_authorized_error(e)
    render_error Api::AuthorizationError.new(e), 403
  end

  def render_record_invalid_error(record)
    render_error(Api::RecordError.new(:record_invalid, record), 400)
  end

  def render_not_found_error
    render_error Api::Error.new(:not_found), 404
  end

  def render_record_not_found_error(_e)
    render_error(Api::Error.new(:record_not_found), 404)
  end

  def render_error(api_error, status)
    render json: api_error.as_json, status: status
  end
end
