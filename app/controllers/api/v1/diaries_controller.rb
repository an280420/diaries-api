module API
  module V1
    class DiariesController < BaseController
      def create
        diary = Diary.new(diary_params)

        if diary.save
          render_success [diary]
        else
          render_errors errors: diary.errors.full_messages, status: 422
        end
      end

      def index
        render_success Diary.all
      end

      private

      def diary_params
        params.require(:diary).permit(:title, :enum, :expiration)
      end
    end
  end
end