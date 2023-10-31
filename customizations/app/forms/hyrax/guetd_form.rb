# Generated via
#  `rails generate hyrax:work Guetd`
module Hyrax
  # Generated form for Guetd
  class GuetdForm < Hyrax::Forms::WorkForm
    self.model_class = ::Guetd
    self.required_fields = [
      :title,
      :creator,
      :advisor,
      :date_created,
      :identifier,
      :abstract,
      :subject,
      :rights_statement,
      :resource_type,
      :format,
      :extent,
      :language,
    ]
    self.terms = self.required_fields + [
      :keyword,
      :issued,
      :description,
      :embargo_terms,
      :embargo_lift_date,
      :date_available,
      :license,
      :editor, 
      :relation,
      :publisher,
      :rights_notes,
      :rights_holder
    ]
  end
end
