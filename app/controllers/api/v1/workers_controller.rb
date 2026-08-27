module Api
  module V1
    class WorkersController < ActionController::API
      def index
        workers = Worker.all
        render json: workers
      end

      def show
        worker = Worker.find(params[:id])
        render json: worker
      end

      def create
        worker = Worker.new(worker_params)

        if worker.save
          render json: worker, status: :created
        else
          render json: worker.errors,
                 status: :unprocessable_entity
        end
      end

      def update
        worker = Worker.find(params[:id])

        if worker.update(worker_params)
          render json: worker, status: :ok
        else
          render json: worker.errors,
                 status: :unprocessable_entity
        end
      end

      def destroy
        worker = Worker.find(params[:id])

        if worker.destroy
          render json: {
            message: "Obreiro eliminado com sucesso"
          }, status: :ok
        else
          render json: {
            error: "Erro ao eliminar obreiro"
          }, status: :unprocessable_entity
        end
      end

      private

      def worker_params
        params.require(:worker).permit(
          :name,
          :function,
          :area,
          :phone,
          :email,
          :celula_id
        )
      end
    end
  end
end
