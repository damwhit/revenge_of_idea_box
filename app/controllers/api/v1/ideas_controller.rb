module Api
  module V1
    class IdeasController < ApiController
      def index
        if params[:search]
          term = params[:search].try(:downcase)
          respond_with Idea.where("LOWER(title) LIKE :term OR LOWER(body) LIKE :term", term: "%#{term}%")
        else
          respond_with Idea.order(created_at: :desc)
        end
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
