class MusicianForm < MailForm::Base
  attribute :musician_name,      :validate => true
  attribute :musician_contact,   :validate => true
  attribute :musician_phone,     :validate => false      
  attribute :musician_email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :musician_url,       :validate => true
  attribute :musician_comments,       :validate => false

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Inscripción de banda - #{musician_name}",
      :to => "contacto@radioperu.pe",
      :from => %("#{musician_name}" <#{musician_email}>)
    }
  end
end
