module Api
  module V1
    class DashboardController < ActionController::API
      def index
        render json: {

          membros: Member.count,

          pastores: Pastor.count,

          obreiros: Worker.count,

          celulas: Celula.count,

          coros: Choir.count,

          casamentos: Wedding.count,

          batismos: Baptism.count,

          atendimentos_pendentes: Appointment.where(status: "Pendente").count,


          departamentos: Department.count,

          noticias: News.count,

          atividades: Activity.count,

          agenda: Schedule.count

        }
      end
    end
  end
end
