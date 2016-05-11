module Api
  module V1
    class IdeasController < ApiController
      def index
        respond_with Idea.order(updated_at: :desc)
      end
    end
  end
end
