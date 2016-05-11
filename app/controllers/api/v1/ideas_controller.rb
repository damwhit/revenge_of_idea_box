module Api
  module V1
    class IdeasController < ApiController
      def index
        respond_with Idea.order(updated_at: :desc)
      end

      def create
        respond_with Idea.create(idea_params), location: nil
      end

      def idea_params
        params.permit(:title, :body)
      end
    end
  end
end
