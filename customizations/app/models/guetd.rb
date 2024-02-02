# Generated via
#  `rails generate hyrax:work Guetd`
class Guetd < ActiveFedora::Base
  include ::Hyrax::WorkBehavior
  include ::Bulkrax::Metadata

  self.indexer = GuetdIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }

  property :advisor, predicate: ::RDF::URI.new("https://repository.library.georgetown.edu/ns#advisor") do |index|
    index.as :stored_searchable, :facetable
  end

  property :coverage, predicate: ::RDF::Vocab::DC11.coverage do |index|
    index.as :stored_searchable
  end

  property :date_available, predicate: ::RDF::Vocab::DC.available do |index|
    index.as :stored_searchable
  end

  property :date_copyrighted, predicate: ::RDF::Vocab::DC.dateCopyrighted do |index|
    index.as :stored_searchable
  end

  property :date_issued, predicate: ::RDF::Vocab::DC.issued do |index|
    index.as :stored_searchable
  end

  #TODO: Replace repository.libary.georgetown.edu with new DG domain (once live)
  property :department, predicate: ::RDF::URI.new("https://repository.library.georgetown.edu/ns#department") do |index|
    index.as :stored_searchable, :facetable
  end

  #TODO: Replace repository.libary.georgetown.edu with new DG domain (once live)
  property :doi, predicate: ::RDF::URI.new("https://repository.library.georgetown.edu/ns#doi") do |index|
    index.as :stored_searchable
  end

  #TODO: Replace repository.libary.georgetown.edu with new DG domain (once live)
  property :embargo_date, predicate: ::RDF::URI.new("https://repository.library.georgetown.edu/ns#embargo_date") do |index|
    index.as :stored_searchable
  end

  #TODO: Replace repository.libary.georgetown.edu with new DG domain (once live)
  property :embargo_lift_date, predicate: ::RDF::URI.new("https://repository.library.georgetown.edu/ns#embargo_lift_date") do |index|
    index.as :stored_searchable
  end

  #TODO: Replace repository.libary.georgetown.edu with new DG domain (once live)
  property :embargo_terms, predicate: ::RDF::URI.new("https://repository.library.georgetown.edu/ns#embargo_terms") do |index|
    index.as :stored_searchable
  end

  property :extent, predicate: ::RDF::Vocab::DC.extent do |index|
    index.as :stored_searchable
  end

  property :format, predicate: ::RDF::Vocab::DC.format do |index|
    index.as :stored_searchable, :facetable
  end

  #TODO: Replace repository.libary.georgetown.edu with new DG domain (once live)
  property :handle, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#handle"), multiple: false do |index|
    index.as :stored_searchable
  end

  #TODO: Replace repository.libary.georgetown.edu with new DG domain (once live)
  property :orcid, predicate: ::RDF::URI.new("https://repository.library.georgetown.edu/ns#orcid") do |index|
    index.as :stored_searchable
  end

  #TODO: Replace repository.libary.georgetown.edu with new DG domain (once live)
  property :lcc, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#lcc"), multiple: false do |index|
    index.as :stored_searchable
  end

  property :provenance, predicate: ::RDF::Vocab::DC.provenance do |index|
    index.as :stored_searchable
  end

  property :relation, predicate: ::RDF::Vocab::DC11.relation do |index|
    index.as :stored_searchable
  end

  #TODO: Replace repository.libary.georgetown.edu with new DG domain (once live)
  property :repository_legacy, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#repository_legacy"), multiple: false do |index|
    index.as :stored_searchable
  end

  property :table_of_contents, predicate: ::RDF::Vocab::DC.tableOfContents do |index|
    index.as :stored_searchable
  end

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  include ::Hyrax::BasicMetadata
end
