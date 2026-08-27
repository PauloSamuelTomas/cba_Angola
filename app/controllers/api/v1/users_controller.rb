module Api
  module V1
    class UsersController < ActionController::API
      # ==========================================
      # LISTAR UTILIZADORES
      # ==========================================
      def index
        users = User.all

        render json: users
      end


      # ==========================================
      # MOSTRAR UTILIZADOR
      # ==========================================
      def show
        user = User.find(params[:id])

        render json: user
      end


      # ==========================================
      # CRIAR UTILIZADOR
      # ==========================================
      def create
        user = User.new(user_params)

        if user.save

          render json: user,
                 status: :created

        else

          render json: {
            errors: user.errors.full_messages
          },
          status: :unprocessable_entity

        end
      end


      # ==========================================
      # ATUALIZAR UTILIZADOR
      # ==========================================
      def update
        user = User.find(params[:id])

        if user.update(user_params)

          render json: user,
                 status: :ok

        else

          render json: {
            errors: user.errors.full_messages
          },
          status: :unprocessable_entity

        end
      end


      # ==========================================
      # ELIMINAR UTILIZADOR
      # ==========================================
      def destroy
        user = User.find(params[:id])

        if user.destroy

          render json: {
            message: "Utilizador eliminado com sucesso"
          },
          status: :ok

        else

          render json: {
            error: "Erro ao eliminar utilizador"
          },
          status: :unprocessable_entity

        end
      end


      private


      # ==========================================
      # PARÂMETROS DO UTILIZADOR
      # ==========================================
      def user_params
        params.require(:user).permit(
          :name,
          :email,
          :password,
          :password_confirmation,
          :role
        )
      end
    end
  end
end
