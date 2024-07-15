# Generated via
#  `rails generate hyrax:work GllWork`
module Hyrax
  # Generated form for GllWork
  class GllWorkForm < Hyrax::Forms::WorkForm
    self.model_class = ::GllWork
    self.required_fields = [
      :title,
      :creator,
      :date_available,
      :format,
      :resource_type,
      :rights_statement
    ]
    recommended_fields = [
      :abstract,
      :advisor,
      :alternative_title,
      :bibliographic_citation,
      :classification,
      :contributor,
      :coverage,
      :date,
      :date_available,
      :date_copyrighted,
      :date_created,
      :date_issued,
      :description,
      :editor,
      :extent,
      :govdoc,
      :gu_is_part_of,
      :identifier,
      :is_part_of_series,
      :isbn,
      :issn,
      :keyword,
      :language,
      :lcc,
      :lcsh,
      :medium,
      :orcid,
      :other_identifier,
      :provenance,
      :publisher,
      :relation,
      :relation_uri,
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
