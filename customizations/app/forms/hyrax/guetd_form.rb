# Generated via
#  `rails generate hyrax:work Guetd`
module Hyrax
  # Generated form for Guetd
  class GuetdForm < Hyrax::Forms::WorkForm
    self.model_class = ::Guetd
    self.required_fields = [
      :title,
      :creator,
      :abstract,
      :advisor,
      :date_created,
      :department,
      :description,
      :language,
      :resource_type,
      :rights_statement
    ]
    self.terms = self.required_fields + [
      :contributor,
      :coverage, 
      :date_available,
      :date_copyrighted,
      :date_issued,
      :doi,
      :embargo_date,
      :embargo_lift_date,
      :embargo_terms,
      :extent,
      :format,
      :identifier,
      :keyword,
      :license,
      :orcid,
      :publisher,
      :relation,
      :rights_notes,
      :source,
      :subject,
      :table_of_contents
    ]
  end
end
