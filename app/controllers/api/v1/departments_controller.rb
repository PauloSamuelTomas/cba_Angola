module Api
  module V1
    class DepartmentsController < ActionController::API
      def index
        departments = Department.all
        render json: departments
      end


      def show
        department = Department.find(params[:id])
        render json: department
      end


      def create
        department = Department.new(department_params)

        if department.save
          render json: department, status: :created
        else
          render json: department.errors,
                 status: :unprocessable_entity
        end
      end



      # EDITAR DEPARTAMENTO
      def update
        department = Department.find(params[:id])


        if department.update(department_params)

          render json: department,
                 status: :ok

        else

          render json: department.errors,
                 status: :unprocessable_entity

        end
      end



      # EXCLUIR DEPARTAMENTO
      def destroy
        department = Department.find(params[:id])


        if department.destroy

          render json: {
            message: "Departamento eliminado com sucesso"
          },
          status: :ok

        else

          render json: {
            error: "Erro ao eliminar departamento"
          },
          status: :unprocessable_entity

        end
      end



      private


      def department_params
        params.require(:department)
              .permit(
                :name,
                :responsavel,
                :description,
                member_ids: []
              )
      end
    end
  end
end
