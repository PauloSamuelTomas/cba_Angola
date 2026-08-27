module Api
  module V1
    class PastorsController < ActionController::API
      def index
        pastors = Pastor.all
        render json: pastors
      end
      def show
        pastor = Pastor.find(params[:id])
        render json: pastor
      end
      # """"""""""""""""""""""""""""""""""""""""""""""""""""""
      # Cria um pastor
      # """"""""""""""""""""""""""""""""""""""""""""""""""""""
      def create
        pastor = Pastor.new(pastor_params)
        if pastor.save
          render json: pastor, status: :created
        else
          render json: pastor.errors, status: :unprocessable_entity
        end
      end

      # """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
      # Atualizar um pastor
      # """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
      def update
        pastor = Pastor.find(params[:id])
        if pastor.update(pastor_params)
          render json: pastor, status: :ok
        else
          render json: pastor.errors, status: :unprocessable_entity
        end
      end
      # """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
      # Eliminar pastor
      # """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
      def destroy
        pastor = Pastor.find(params[:id])
        if pastor.destroy
          render json: { message: "Eliminado com sucesso" }, status: :ok
        else
            render json: { error: "Erro ao eliminar pastor" }, status: :unprocessable_entity
        end
      end
      # """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      # Parametros Permitidos
      # """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

      private
      def pastor_params
        params.require(:pastor).permit(
            :name,
            :phone,
            :email,
            :biography
            )
      end
    end
  end
end
