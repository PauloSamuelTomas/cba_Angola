module Api
  module V1
    class BaptismsController < ActionController::API
      # ==========================================
      # LISTAR BATISMOS
      # ==========================================
      def index
        baptisms = Baptism.all

        render json: baptisms
      end


      # ==========================================
      # MOSTRAR UM BATISMO
      # ==========================================
      def show
        baptism = Baptism.find(params[:id])

        render json: baptism
      end


      # ==========================================
      # CRIAR BATISMO
      # ==========================================
      def create
        baptism = Baptism.new(baptism_params)

        if baptism.save
          render json: baptism, status: :created
        else
          render json: {
            errors: baptism.errors.full_messages
          }, status: :unprocessable_entity
        end
      end


      # ==========================================
      # ATUALIZAR BATISMO
      # ==========================================
      def update
        baptism = Baptism.find(params[:id])

        if baptism.update(baptism_params)
          render json: baptism, status: :ok
        else
          render json: {
            errors: baptism.errors.full_messages
          }, status: :unprocessable_entity
        end
      end


      # ==========================================
      # CONFIRMAR BATISMO E CRIAR MEMBRO
      # ==========================================
      def confirm
        baptism = Baptism.find(params[:id])

        # ------------------------------------------
        # Confirmar que a pessoa foi batizada
        # ------------------------------------------
        unless params[:baptized].to_s == "true"
          render json: {
            error: "Confirme que a pessoa foi batizada antes de a transformar em membro."
          }, status: :unprocessable_entity

          return
        end


        # ------------------------------------------
        # Verificar se o batismo já foi realizado
        # ------------------------------------------
        if baptism.status == "realizado"
          render json: {
            error: "Este batismo já foi realizado."
          }, status: :unprocessable_entity

          return
        end


        member = nil


        ActiveRecord::Base.transaction do
          # ----------------------------------------
          # Criar membro usando dados do batismo
          # ----------------------------------------
          nome_partes = baptism.name.strip.split

          first_name = nome_partes.first
          last_name = nome_partes[1..]&.join(" ")

          # Se tiver apenas um nome, usa "-" como apelido provisório
          last_name = "-" if last_name.blank?

          member = Member.create!(
            first_name: first_name,
            last_name: last_name,
            gender: baptism.gender,
            birth_date: baptism.birth_date,
            phone: baptism.phone,
            email: baptism.email,
            address: baptism.address,
            department_id: member_params[:department_id],
            celula_id: member_params[:celula_id],
            choir_id: member_params[:choir_id],
            status: "ativo"
          )


          # ----------------------------------------
          # Marcar batismo como realizado
          # ----------------------------------------
          baptism.update!(
            status: "realizado"
          )
        end


        # ------------------------------------------
        # Resposta
        # ------------------------------------------
        render json: {
          message: "Batismo confirmado e membro criado com sucesso",
          baptism: baptism,
          member: member
        }, status: :created


      rescue ActiveRecord::RecordInvalid => e

        render json: {
          errors: e.record.errors.full_messages
        }, status: :unprocessable_entity
      end


      # ==========================================
      # ELIMINAR BATISMO
      # ==========================================
      def destroy
        baptism = Baptism.find(params[:id])

        if baptism.destroy
          render json: {
            message: "Batismo eliminado com sucesso"
          }, status: :ok
        else
          render json: {
            error: "Erro ao eliminar o batismo"
          }, status: :unprocessable_entity
        end
      end


      private


      # ==========================================
      # PARÂMETROS DO BATISMO
      # ==========================================
      def baptism_params
        params.require(:baptism).permit(
          :name,
          :phone,
          :email,
          :birth_date,
          :gender,
          :address,
          :date,
          :location,
          :status,
          :pastor_id
        )
      end


      # ==========================================
      # DADOS COMPLEMENTARES DO MEMBRO
      # ==========================================
      def member_params
        params.require(:member).permit(
          :department_id,
          :celula_id,
          :choir_id
        )
      end
    end
  end
end
