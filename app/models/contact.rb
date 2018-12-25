class Contact < MailForm::Base
  attribute :name,     :validate => true
  attribute :email,     :validate => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  attribute :sujet,     :validate => true
  attribute :message,     :validate => true

  def headers
    {
        :subject => "Formulaire de contact",
        :to => "edgar.bekier@gmail.com",
        :from => %("#{name}" <#{email}>)
    }
  end
end