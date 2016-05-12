module Api
  module V1
    class IdeasController < ApiController
      def index
        respond_with Idea.order(updated_at: :desc)
      end

      def create
        respond_with Idea.create(idea_params), location: nil
      end

      def destroy
        respond_with Idea.find(params[:id]).destroy, location: nil
      end

      def update
        idea = Idea.find(params[:id])
        if params[:change]
          idea.change_quality(params[:quality], params[:change])
        else
          idea.update(idea_params)
        end
        respond_with idea, location: nil
      end

      def idea_params
        params.permit(:title, :body)
      end
    end
  end
end
