module Api
  module V1
    class SettingsController < ActionController::API
      def index
        settings = Setting.all
        render json: settings
      end
      def show
        setting = Setting.find(params[:id])
        render json: setting
      end
    end
  end
end
