module Api
  module V1
    class CelulasController < ActionController::API
      # ==========================================
      # LISTAR CÉLULAS
      # ==========================================
      def index
        celulas = Celula.includes(:responsavel, :workers)

        render json: celulas.as_json(
          include: {
            responsavel: {
              only: [ :id, :name ]
            }
          }
        )
      end


      # ==========================================
      # MOSTRAR UMA CÉLULA
      # ==========================================
      def show
        celula = Celula.includes(:responsavel, :workers)
                       .find(params[:id])

        render json: celula.as_json(
          include: {
            responsavel: {
              only: [ :id, :name ]
            }
          }
        )
      end


      # ==========================================
      # CRIAR CÉLULA
      # ==========================================
      def create
        celula = Celula.new(celula_params)

        if celula.save
          render json: celula.as_json(
            include: {
              responsavel: {
                only: [ :id, :name ]
              }
            }
          ), status: :created
        else
          render json: {
            errors: celula.errors.full_messages
          }, status: :unprocessable_entity
        end
      end


      # ==========================================
      # ATUALIZAR CÉLULA
      # ==========================================
      def update
        celula = Celula.find(params[:id])

        if celula.update(celula_params)

          render json: celula.as_json(
            include: {
              responsavel: {
                only: [ :id, :name ]
              }
            }
          ), status: :ok

        else

          render json: {
            errors: celula.errors.full_messages
          }, status: :unprocessable_entity

        end
      end


      # ==========================================
      # EXCLUIR CÉLULA
      # ==========================================
      def destroy
        celula = Celula.find(params[:id])

        if celula.destroy

          render json: {
            message: "Célula eliminada com sucesso"
          }, status: :ok

        else

          render json: {
            error: "Erro ao eliminar célula"
          }, status: :unprocessable_entity

        end
      end


      # ==========================================
      # PARÂMETROS PERMITIDOS
      # ==========================================
      private

      def celula_params
        params.require(:celula)
              .permit(
                :name,
                :description,
                :responsavel_id
              )
      end
    end
  end
end
