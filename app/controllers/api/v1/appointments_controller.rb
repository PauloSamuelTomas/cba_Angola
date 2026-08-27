module Api
  module V1
    class AppointmentsController < ActionController::API
      def index
        appointments = Appointment.all
        render json: appointments
      end

      def show
        appointment = Appointment.find(params[:id])
        render json: appointment
      end

      def create
        appointment = Appointment.new(appointment_params)

        if appointment.save
          render json: appointment, status: :created
        else
          render json: {
            errors: appointment.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      def update
        appointment = Appointment.find(params[:id])

        if appointment.update(appointment_params)
          render json: appointment, status: :ok
        else
          render json: {
            errors: appointment.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      def destroy
        appointment = Appointment.find(params[:id])

        if appointment.destroy
          render json: {
            message: "Atendimento eliminado com sucesso"
          }, status: :ok
        else
          render json: {
            error: "Erro ao eliminar o atendimento"
          }, status: :unprocessable_entity
        end
      end

      private

      def appointment_params
        params.require(:appointment).permit(
          :name,
          :email,
          :phone,
          :date,
          :time,
          :subject,
          :status,
          :member_id,
          :pastor_id
        )
      end
    end
  end
end
