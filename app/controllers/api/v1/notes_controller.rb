module API
  module V1
    class NotesController < BaseController
      before_action :set_note, except: [:index, :new, :create]

      def create
        note = find_diary(params[:diary_id]).notes.new(note_params)
        # note = Note.new(note_params)

        if note.save
          render_success [note]
        else
          render_errors errors: note.errors.full_messages, status: 422
        end
      end

      def index
        notes = find_diary(params[:diary_id]).notes
        render_success [notes]
      end

      def show
        render_success [@note]
      end

      def update
        if @note.update(note_params)
          render_success [@note]
        else
          render_errors errors: @note.errors.full_messages, status: 422
        end
      end

      def destroy
        @note.destroy
        render json: @note, status: 204 
      end

      private

      def find_diary(diary_id)
        Diary.find(diary_id)
      end

      def set_note
        @note = Note.find(params[:id])
      end

      def note_params
        params.require(:note).permit(:text)
      end
    end
  end
end
