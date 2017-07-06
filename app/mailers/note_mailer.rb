class NoteMailer < ApplicationMailer
  def new_like(note, liker)
    @note = note
    @liker = liker

    mail to: @note.user.email, subject: 'Someone has liked your note!'
  end
end
