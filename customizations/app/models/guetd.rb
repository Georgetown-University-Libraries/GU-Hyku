# Generated via
#  `rails generate hyrax:work Guetd`
class Guetd < ActiveFedora::Base
  include ::Hyrax::WorkBehavior

  self.indexer = GuetdIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }

  property :advisor, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#advisor") do |index|
    index.as :stored_searchable, :facetable
  end

  property :date_available, predicate: ::RDF::Vocab::DC.available do |index|
    index.as :stored_searchable
  end

  property :editor, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#editor") do |index|
    index.as :stored_searchable, :facetable
  end

  property :embargo_lift_date, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#embargo_lift_date") do |index|
    index.as :stored_searchable
  end

  property :embargo_terms, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#embargo_terms") do |index|
    index.as :stored_searchable
  end

  property :extent, predicate: ::RDF::Vocab::DC.extent do |index|
    index.as :stored_searchable
  end

  property :date_issued, predicate: ::RDF::Vocab::DC.issued do |index|
    index.as :stored_searchable
  end

  property :format, predicate: ::RDF::Vocab::DC.format do |index|
    index.as :stored_searchable, :facetable
  end

  property :provenance, predicate: ::RDF::Vocab::DC.provenance do |index|
    index.as :stored_searchable
  end

  property :relation, predicate: ::RDF::Vocab::DC11.relation do |index|
    index.as :stored_searchable
  end

  property :rights_holder, predicate: ::RDF::Vocab::DC.rightsHolder do |index|
    index.as :stored_searchable
  end

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  include ::Hyrax::BasicMetadata
end
