# Generated via
#  `rails generate hyrax:work GuScholar`
class GuScholar < ActiveFedora::Base
  include ::Hyrax::WorkBehavior

  self.indexer = GuScholarIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }

  property :advisor, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#advisor") do |index|
    index.as :stored_searchable, :facetable
  end

  property :bibliographic_citation, predicate: ::RDF::Vocab::DC.bibliographicCitation do |index|
    index.as :stored_searchable
  end

  property :coverage, predicate: ::RDF::Vocab::DC11.coverage do |index|
    index.as :stored_searchable
  end

  property :date_copyrighted, predicate: ::RDF::Vocab::DC.dateCopyrighted do |index|
    index.as :stored_searchable
  end

  property :date_issued, predicate: ::RDF::Vocab::DC.issued do |index|
    index.as :stored_searchable
  end

  property :department, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#department") do |index|
    index.as :stored_searchable, :facetable
  end

  property :doi, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#doi") do |index|
    index.as :stored_searchable
  end

  property :extent, predicate: ::RDF::Vocab::DC.extent do |index|
    index.as :stored_searchable
  end
  
  property :format, predicate: ::RDF::Vocab::DC.format do |index|
    index.as :stored_searchable, :facetable
  end

  property :issn, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#issn") do |index|
    index.as :stored_searchable
  end

  property :provenance, predicate: ::RDF::Vocab::DC.provenance do |index|
    index.as :stored_searchable
  end

  property :orcid, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#orcid") do |index|
    index.as :stored_searchable
  end

  property :relation, predicate: ::RDF::Vocab::DC11.relation do |index|
    index.as :stored_searchable
  end

  property :table_of_contents, predicate: ::RDF::Vocab::DC.tableOfContents do |index|
    index.as :stored_searchable
  end

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  include ::Hyrax::BasicMetadata
end
