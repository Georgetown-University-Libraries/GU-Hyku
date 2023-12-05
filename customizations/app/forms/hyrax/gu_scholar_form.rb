# Generated via
#  `rails generate hyrax:work GuScholar`
module Hyrax
  # Generated form for GuScholar
  class GuScholarForm < Hyrax::Forms::WorkForm
    self.model_class = ::GuScholar
    self.required_fields = [
      :title,
      :creator,
      :date_created,
      :department,
      :language,
      :resource_type,
      :rights_statement
    ]
    recommended_fields = [
      :abstract,
      :advisor,
      :bibliographic_citation,
      :contributor,
      :coverage,
      :date_available,
      :date_copyrighted,
      :date_issued, 
      :description,
      :doi,
      :extent,
      :format,
      :identifier,
      :issn,
      :keyword,
      :orcid,
      :publisher,
      :relation,
      :rights_notes,
      :source,
      :subject,
      :identifier,
      :table_of_contents
    ]
    ommitted_fields = [
      :alternative_title,
      :access_right,
      :based_near,
      :related_url,
      :license
    ]
    non_metadata_fields = self.terms - recommended_fields - self.required_fields - ommitted_fields
    self.terms = self.required_fields + recommended_fields + non_metadata_fields
  end
end
