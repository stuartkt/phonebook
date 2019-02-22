module Api
  class AuthorizationError < Error
    attr_accessor :details

    def initialize(pundit_error)
      policy_name = pundit_error.policy.class.to_s.underscore
      message = I18n.t "#{policy_name}.#{pundit_error.query}", scope: 'pundit', default: :default
      super :not_authorized, message: message
    end
  end
end
