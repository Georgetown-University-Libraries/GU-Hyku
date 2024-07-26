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
      :language,
      :resource_type,
      :rights_statement
    ]
    recommended_fields = [
      :abstract,
      :advisor,
      :alternative_title,
      :bibliographic_citation,
      :contributor,
      :coverage,
      :date_available,
      :date_copyrighted,
      :date_issued, 
      :description,
      :doi,
      :editor,
      :embargo_date,
      :embargo_lift_date,
      :embargo_terms,
      :extent,
      :format,
      :govdoc,
      :identifier,
      :isbn,
      :issn,
      :keyword,
      :lcc,
      :orcid,
      :provenance,
      :publisher,
      :relation,
      :relation_uri,
      :rights_notes,
      :source,
      :spatial,
      :subject,
      :identifier,
      :table_of_contents,
      :temporal
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
