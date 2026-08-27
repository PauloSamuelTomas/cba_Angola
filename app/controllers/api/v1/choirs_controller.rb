
module Api
  module V1
    class ChoirsController < ActionController::API
      # ==========================================
      # LISTAR COROS
      # ==========================================

      def index
        choirs = Choir.all

        render json: choirs
      end


      # ==========================================
      # MOSTRAR UM CORO
      # ==========================================

      def show
        choir = Choir.find(params[:id])

        render json: choir
      end


      # ==========================================
      # CRIAR CORO
      # ==========================================

      def create
        choir = Choir.new(choir_params)

        if choir.save

          render json: choir,
                 status: :created

        else

          render json: choir.errors,
                 status: :unprocessable_entity

        end
      end


      # ==========================================
      # ATUALIZAR CORO
      # ==========================================

      def update
        choir = Choir.find(params[:id])

        if choir.update(choir_params)

          render json: choir,
                 status: :ok

        else

          render json: choir.errors,
                 status: :unprocessable_entity

        end
      end


      # ==========================================
      # EXCLUIR CORO
      # ==========================================

      def destroy
        choir = Choir.find(params[:id])

        if choir.destroy

          render json: {
            message: "Coro eliminado com sucesso"
          },
          status: :ok

        else

          render json: {
            error: "Erro ao eliminar coro"
          },
          status: :unprocessable_entity

        end
      end


      # ==========================================
      # PARAMETROS
      # ==========================================

      private

      def choir_params
        params.require(:choir)
              .permit(
                :name,
                :leader,
                :description
              )
      end
    end
  end
end
