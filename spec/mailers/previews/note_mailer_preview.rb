# Preview all emails at http://localhost:3000/rails/mailers/note_mailer
class NoteMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/note_mailer/new_like
  def new_like
    NoteMailerMailer.new_like
  end

end
