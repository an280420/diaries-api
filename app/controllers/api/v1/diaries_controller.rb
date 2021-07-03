module API
  module V1
    class DiariesController < BaseController
      before_action :set_diary, except: [:index, :new, :create]
      
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

      def show
        render_success [@diary]
      end

      def update
        if @diary.update(diary_params)
          render_success [@diary]
        else
          render_errors errors: @diary.errors.full_messages, status: 422
        end
      end

      def destroy
        @diary.destroy
        render json: @diary, status: 204 
      end

      private

      def set_diary
        @diary = Diary.find(params[:id])
      end

      def diary_params
        params.require(:diary).permit(:title, :enum, :expiration)
      end
    end
  end
end
