module Api
  module V1
    class BaseController < ApiController
      include ApiErrors
      serialization_scope :view_context

      def not_found
        render_not_found_error
      end
    end
  end
end
