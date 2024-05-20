# Generated via
#  `rails generate hyrax:work GuWork`
module Hyrax
  # Generated form for GuWork
  class GuWorkForm < Hyrax::Forms::WorkForm
    self.model_class = ::GuWork
    self.required_fields = [
      :title,
      :creator,
      :date_created,
      :description,
      :language,
      :resource_type,
      :rights_statement,
      :source
    ]
    recommended_fields = [
      :abstract,
      :alternative_title,
      :archivesspace_id,
      :bibliographic_citation,
      :contributor,
      :coverage,
      :date_available,
      :date_copyrighted,
      :embargo_date,
      :embargo_lift_date,
      :embargo_terms,
      :extent,
      :format,
      :govdoc,
      :gu_is_part_of,
      :identifier,
      :is_part_of_series,
      :isbn,
      :keyword,
      :lcc,
      :publisher,
      :provenance,
      :relation,
      :relation_uri,
      :repository_legacy,
      :rights_notes,  
      :spatial,
      :subject,
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
