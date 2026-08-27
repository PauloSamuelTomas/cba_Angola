module Api
  module V1
    class NewsController < ActionController::API
      def index
        news = News.all

        render json: news,
               each_serializer: NewsSerializer
      end


      def show
        news = News.find(params[:id])

        render json: news,
               serializer: NewsSerializer
      end


      def create
        news = News.new(news_params)

        if news.save

          render json: news,
                 serializer: NewsSerializer,
                 status: :created

        else

          render json: {
            errors: news.errors.full_messages
          },
          status: :unprocessable_entity

        end
      end


      def update
        news = News.find(params[:id])

        if news.update(news_params)

          render json: news,
                 serializer: NewsSerializer,
                 status: :ok

        else

          render json: {
            errors: news.errors.full_messages
          },
          status: :unprocessable_entity

        end
      end


      def destroy
        news = News.find(params[:id])

        if news.destroy

          render json: {
            message: "Notícia eliminada com sucesso"
          },
          status: :ok

        else

          render json: {
            error: "Erro ao eliminar notícia"
          },
          status: :unprocessable_entity

        end
      end


      private

      def news_params
        params.require(:news).permit(
          :title,
          :content,
          :published,
          :user_id,
          :image,
          :published_at
        )
      end
    end
  end
end
