module Api
  module V1
    class TestController < ApplicationController
      def index
        render json: {
          message: "API da CBA funcionando!",
          status: 200
        }
      end
    end
  end
end
