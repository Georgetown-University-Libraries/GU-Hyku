# Generated via
#  `rails generate hyrax:work GuWork`
class GuWork < ActiveFedora::Base
  include ::Hyrax::WorkBehavior

  self.indexer = GuWorkIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }

  property :archivesspace_id, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#archivesspace_id") do |index|
    index.as :stored_searchable
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

  property :extent, predicate: ::RDF::Vocab::DC.extent do |index|
    index.as :stored_searchable
  end

  property :format, predicate: ::RDF::Vocab::DC.format do |index|
    index.as :stored_searchable, :facetable
  end

  property :is_part_of, predicate: ::RDF::Vocab::DC.isPartOf do |index|
    index.as :stored_searchable
  end

  property :is_part_of_series, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#is_part_of_series") do |index|
    index.as :stored_searchable
  end

  property :provenance, predicate: ::RDF::Vocab::DC.provenance do |index|
    index.as :stored_searchable
  end

  property :relation, predicate: ::RDF::Vocab::DC.relation do |index|
    index.as :stored_searchable
  end

  #This property is used in Bulkrax: https://github.com/samvera/bulkrax/wiki/Configuring-Bulkrax#source-identifier
  property :source_identifier, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#bulkrax_identifier"), multiple: false do |index|
    index.as :stored_searchable
  end

  property :table_of_contents, predicate: ::RDF::Vocab::DC.tableOfContents do |index|
    index.as :stored_searchable
  end

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  include ::Hyrax::BasicMetadata
end
