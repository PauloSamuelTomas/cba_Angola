module Api
  module V1
    class WeddingsController < ActionController::API
      # LISTAR CASAMENTOS
      def index
        weddings = Wedding.all
        render json: weddings
      end

      # MOSTRAR UM CASAMENTO
      def show
        wedding = Wedding.find(params[:id])
        render json: wedding
      end

      # CRIAR CASAMENTO
      def create
        wedding = Wedding.new(wedding_params)

        if wedding.save
          render json: wedding, status: :created
        else
          render json: {
            errors: wedding.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      # ATUALIZAR CASAMENTO
      def update
        wedding = Wedding.find(params[:id])

        if wedding.update(wedding_params)
          render json: wedding, status: :ok
        else
          render json: {
            errors: wedding.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      # ELIMINAR CASAMENTO
      def destroy
        wedding = Wedding.find(params[:id])

        if wedding.destroy
          render json: {
            message: "Eliminado com sucesso"
          }, status: :ok
        else
          render json: {
            error: "Erro ao eliminar"
          }, status: :unprocessable_entity
        end
      end

      private

      def wedding_params
        params.require(:wedding).permit(
          :groom,
          :bride,
          :date,
          :pastor_id
        )
      end
    end
  end
end
