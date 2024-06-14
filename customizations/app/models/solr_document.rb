# frozen_string_literal: true

class SolrDocument
  include Blacklight::Solr::Document
  include BlacklightOaiProvider::SolrDocument

  include Blacklight::Gallery::OpenseadragonSolrDocument

  # Adds Hyrax behaviors to the SolrDocument.
  include Hyrax::SolrDocumentBehavior

  # self.unique_key = 'id'

  # Email uses the semantic field mappings below to generate the body of an email.
  SolrDocument.use_extension(Blacklight::Document::Email)

  # SMS uses the semantic field mappings below to generate the body of an SMS email.
  SolrDocument.use_extension(Blacklight::Document::Sms)

  # DublinCore uses the semantic field mappings below to assemble an OAI-compliant Dublin Core document
  # Semantic mappings of solr stored fields. Fields may be multi or
  # single valued. See Blacklight::Document::SemanticFields#field_semantics
  # and Blacklight::Document::SemanticFields#to_semantic_values
  # Recommendation: Use field names from Dublin Core
  use_extension(Blacklight::Document::DublinCore)

  # Do content negotiation for AF models.
  use_extension(Hydra::ContentNegotiation)

  attribute :extent, Solr::Array, 'extent_tesim'
  attribute :rendering_ids, Solr::Array, 'hasFormat_ssim'
  attribute :account_cname, Solr::Array, 'account_cname_tesim'
  attribute :types, Solr::Array, 'format_tesim'


  attribute :advisor, Solr::Array, 'advisor_tesim'
  attribute :bulkrax_id, Solr::Array, 'bulkrax_id_tesim'
  attribute :coverage, Solr::Array, 'coverage_tesim'
  attribute :classification, Solr::Array, 'classification_tesim'
  attribute :date, Solr::Array, 'date_tesim'
  attribute :date_copyrighted, Solr::Array, 'date_copyrighted_tesim'
  attribute :date_issued, Solr::Array, 'date_issued_tesim'
  attribute :doi, Solr::Array, 'doi_tesim'
  attribute :editor, Solr::Array, 'editor_tesim'
  attribute :embargo_lift_date, Solr::Array, 'embargo_lift_date_tesim'
  attribute :extent, Solr::Array, 'extent_tesim'
  attribute :format, Solr::Array, 'format_tesim'
  attribute :govdoc, Solr::Array, 'govdoc_tesim'
  attribute :gu_is_part_of, Solr::Array, 'gu_is_part_of_tesim'
  attribute :handle, Solr::Array, 'handle_tesim'
  attribute :is_part_of_series, Solr::Array, 'is_part_of_series_tesim'
  attribute :isbn, Solr::Array, 'isbn_tesim'
  attribute :issn, Solr::Array, 'issn_tesim'
  attribute :lcc, Solr::Array, 'lcc_tesim'
  attribute :lcsh, Solr::Array, 'lcsh_tesim'
  attribute :medium, Solr::Array, 'medium_tesim'
  attribute :orcid, Solr::Array, 'orcid_tesim'
  attribute :other_identifier, Solr::Array, 'other_identifier'
  attribute :provenance, Solr::Array, 'provenance_tesim'
  attribute :relation, Solr::Array, 'relation_tesim'
  attribute :relation_uri, Solr::Array, 'relation_uri_tesim'
  attribute :spatial, Solr::Array, 'spatial_tesim'
  attribute :table_of_contents, Solr::Array, 'table_of_contents_tesim'
  attribute :temporal, Solr::Array, 'temporal_tesim'

  field_semantics.merge!(
    contributor: 'contributor_tesim',
    creator: 'creator_tesim',
    date: 'date_created_tesim',
    description: 'description_tesim',
    identifier: 'identifier_tesim',
    language: 'language_tesim',
    publisher: 'publisher_tesim',
    relation: 'nesting_collection__pathnames_ssim',
    rights: 'rights_statement_tesim',
    subject: 'subject_tesim',
    title: 'title_tesim',
    type: 'human_readable_type_tesim'
  )
  def vtt?
    self['mime_type_ssi'] == 'text/vtt'
  end

  def handle 
    self['handle_tesim'].first
  end  

  def language_code
    self['language_codes_ssi']
  end
end
