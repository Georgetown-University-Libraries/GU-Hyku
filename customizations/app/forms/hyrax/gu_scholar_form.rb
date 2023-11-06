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
    self.terms = self.required_fields + [
      :abstract,
      :advisor,
      :bibliographic_citation,
      :contributor,
      :coverage,
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
  end
end
