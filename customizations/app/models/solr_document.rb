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
  
    def language_code
      self['language_codes_ssi']
    end
  end
  