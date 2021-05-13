class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # valida el email
  # https://www.abstractapi.com/email-verification-validation-api
  def validate_email_api
    response = EmailValidate.make_abstract_request(self.email)
    quality_score = response["quality_score"].to_f

    if quality_score < 0.7
      errors.add(:base, I18n.t(:api_email_invalid))
    end
  end
end
