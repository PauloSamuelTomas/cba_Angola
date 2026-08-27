module Api
  module V1
    class ActivitiesController < ActionController::API
      # ==========================================
      # LISTAR ATIVIDADES
      # ==========================================
      def index
        activities = Activity.all

        render json: activities,
               each_serializer: ActivitieSerializer
      end


      # ==========================================
      # MOSTRAR UMA ATIVIDADE
      # ==========================================
      def show
        activity = Activity.find(params[:id])

        render json: activity,
               serializer: ActivitieSerializer
      end


      # ==========================================
      # CRIAR UMA ATIVIDADE
      # ==========================================
      def create
        activity = Activity.new(activity_params)

        if activity.save

          render json: activity,
                 serializer: ActivitieSerializer,
                 status: :created

        else

          render json: {
            errors: activity.errors.full_messages
          },
          status: :unprocessable_entity

        end
      end


      # ==========================================
      # ATUALIZAR UMA ATIVIDADE
      # ==========================================
      def update
        activity = Activity.find(params[:id])

        if activity.update(activity_params)

          render json: activity,
                 serializer: ActivitieSerializer,
                 status: :ok

        else

          render json: {
            errors: activity.errors.full_messages
          },
          status: :unprocessable_entity

        end
      end


      # ==========================================
      # ELIMINAR UMA ATIVIDADE
      # ==========================================
      def destroy
        activity = Activity.find(params[:id])

        if activity.destroy

          render json: {
            message: "Atividade eliminada com sucesso"
          },
          status: :ok

        else

          render json: {
            error: "Erro ao eliminar a atividade"
          },
          status: :unprocessable_entity

        end
      end


      # ==========================================
      # PARÂMETROS PERMITIDOS
      # ==========================================
      private

      def activity_params
        params.require(:activity).permit(
          :title,
          :description,
          :date,
          :time,
          :location,
          :objective,
          :department_id,
          :choir_id
        )
      end
    end
  end
end
