# Generated via
#  `rails generate hyrax:work GuWork`
module Hyrax
  # Generated form for GuWork
  class GuWorkForm < Hyrax::Forms::WorkForm
    self.model_class = ::GuWork
    self.required_fields = [
      :title,
      :contributor,
      :creator,
      :date_created,
      :description,
      :language,
      :resource_type,
      :rights_statement
    ]
    self.terms = self.required_fields + [
      :abstract,
      :archivesspace_id,
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
      :source,
      :subject,
      :table_of_contents 
    ]
  end
end
