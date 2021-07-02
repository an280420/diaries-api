module API
  module V1
    class NotesController < BaseController
      def create
        note = Note.new(note_params)

        if note.save
          render_success [note]
        else
          render_errors errors: note.errors.full_messages, status: 422
        end
      end

      def index
        render_success Note.sorted
      end

      private

      def note_params
        params.require(:note).permit(:text)
      end
    end
  end
end
