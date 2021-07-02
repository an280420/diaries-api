module API
  module V1
    class BaseController < ApplicationController
      private

      def render_success(data)
        render json: { data: data, errors: [] }, status: :ok
      end

      def render_errors(errors:, status:)
        render json: { data: [], errors: errors }, status: status
      end
    end
  end
end
