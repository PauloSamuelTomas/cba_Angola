module Api
  module V1
    class MembersController < ActionController::API
      # ==========================================
      # LISTAR MEMBROS
      # ==========================================
      def index
        members = Member.includes(
          :department,
          :choir,
          :celula
        )

        render json: members
      end


      # ==========================================
      # MOSTRAR MEMBRO
      # ==========================================
      def show
        member = Member.includes(
          :department,
          :choir,
          :celula
        ).find(params[:id])

        render json: member
      end


      # ==========================================
      # CRIAR MEMBRO
      # ==========================================
      def create
        member = Member.new(member_params)

        if member.save
          render json: member, status: :created
        else
          render json: {
            errors: member.errors.full_messages
          }, status: :unprocessable_entity
        end
      end


      # ==========================================
      # ATUALIZAR MEMBRO
      # ==========================================
      def update
        member = Member.find(params[:id])

        if member.update(member_params)
          render json: member, status: :ok
        else
          render json: {
            errors: member.errors.full_messages
          }, status: :unprocessable_entity
        end
      end


      # ==========================================
      # ELIMINAR MEMBRO
      # ==========================================
      def destroy
        member = Member.find(params[:id])

        if member.destroy
          render json: {
            message: "Membro eliminado com sucesso"
          }, status: :ok
        else
          render json: {
            error: "Erro ao eliminar membro"
          }, status: :unprocessable_entity
        end
      end


      private


      # ==========================================
      # PARÂMETROS
      # ==========================================
      def member_params
        params.require(:member).permit(
          :first_name,
          :last_name,
          :gender,
          :birth_date,
          :phone,
          :email,
          :address,
          :department_id,
          :choir_id,
          :celula_id,
          :status
        )
      end
    end
  end
end
