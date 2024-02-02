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
    recommended_fields = [
      :alternative_title,
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
      :lcc,
      :orcid,
      :provenance,
      :publisher,
      :relation,
      :rights_notes,
      :source,
      :subject,
      :table_of_contents
    ]
    ommitted_fields = [
      :access_right,
      :based_near,
      :related_url,
      :license
    ]
    non_metadata_fields = self.terms - recommended_fields - self.required_fields - ommitted_fields
    self.terms = self.required_fields + recommended_fields + non_metadata_fields
  end
end
