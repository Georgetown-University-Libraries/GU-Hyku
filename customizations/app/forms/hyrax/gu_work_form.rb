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
      :archivesspace_id,
      :contributor,
      :coverage,
      :date_available,
      :date_copyrighted,
      :extent,
      :format,
      :identifier,
      :is_part_of,
      :is_part_of_series,
      :keyword,
      :publisher,
      :rights_notes,
      :relation, 
      :subject,
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
