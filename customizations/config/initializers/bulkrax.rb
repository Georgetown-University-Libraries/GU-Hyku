# frozen_string_literal: true

if ENV.fetch('HYKU_BULKRAX_ENABLED', 'true') == 'true'
    Bulkrax.setup do |config|
      # Add local parsers
      # config.parsers += [
      #   { name: 'MODS - My Local MODS parser', class_name: 'Bulkrax::ModsXmlParser', partial: 'mods_fields' },
      # ]
  
      # Field to use during import to identify if the Work or Collection already exists.
      # Default is 'source'.
      # config.system_identifier_field = 'source'
  
      # WorkType to use as the default if none is specified in the import
      # Default is the first returned by Hyrax.config.curation_concerns
      # config.default_work_type = MyWork
  
      # Path to store pending imports
      # config.import_path = 'tmp/imports'
  
      # Path to store exports before download
      # config.export_path = 'tmp/exports'
  
      # Server name for oai request header
      # config.server_name = 'my_server@name.com'
  
      # Field_mapping for establishing a parent-child relationship (FROM parent TO child)
      # This can be a Collection to Work, or Work to Work relationship
      # This value IS NOT used for OAI, so setting the OAI Entries here will have no effect
      # The mapping is supplied per Entry, provide the full class name as a string, eg. 'Bulkrax::CsvEntry'
      # Example:
      #   {
      #     'Bulkrax::RdfEntry'  => 'http://opaquenamespace.org/ns/contents',
      #     'Bulkrax::CsvEntry'  => 'children'
      #   }
      # By default no parent-child relationships are added
      # config.parent_child_field_mapping = { }
  
      # Field_mapping for establishing a collection relationship (FROM work TO collection)
      # This value IS NOT used for OAI, so setting the OAI parser here will have no effect
      # The mapping is supplied per Entry, provide the full class name as a string, eg. 'Bulkrax::CsvEntry'
      # The default value for CSV is collection
      # Add/replace parsers, for example:
      # config.collection_field_mapping['Bulkrax::RdfEntry'] = 'http://opaquenamespace.org/ns/set'
  
      # Field mappings
      # Create a completely new set of mappings by replacing the whole set as follows
      #   config.field_mappings = {
      #     "Bulkrax::OaiDcParser" => { **individual field mappings go here*** }
      #   }
  
      # Add to, or change existing mappings as follows
      #   e.g. to exclude date
      #   config.field_mappings["Bulkrax::OaiDcParser"]["date"] = { from: ["date"], excluded: true  }
  
  
      # default_field_mapping = {
      #   'abstract' => { from: ['abstract'], split: true },
      #   'alternative_title' => { from: ['alternative_title'], split: /\s*[|]\s*/ },
      #   'based_near' => { from: ['based_near'], split: true },
      #   'bibliographic_citation' => { from: ['bibliographic_citation'], split: true },
      #   'contributor' => { from: ['contributor'], split: true },
      #   'create_date' => { from: ['create_date'], split: true },
      #   'children' => { from: ['children'], related_children_field_mapping: true },
      #   'creator' => { from: ['creator'], split: true },
      #   'date_created' => { from: ['date_created'], split: true },
      #   'description' => { from: ['description'], split: true },
      #   'extent' => { from: ['extent'], split: true },
      #   'file' => { from: ['file'], split: /\s*[|]\s*/ },
      #   'identifier' => { from: ['identifier'], split: true },
      #   'keyword' => { from: ['keyword'], split: true },
      #   'language' => { from: ['language'], split: true },
      #   'license' => { from: ['license'], split: /\s*[|]\s*/ },
      #   'modified_date' => { from: ['modified_date'], split: true },
      #   'parents' => { from: ['parents'], related_parents_field_mapping: true },
      #   'publisher' => { from: ['publisher'], split: true },
      #   'related_url' => { from: ['related_url'], split: /\s* [|]\s*/ },
      #   'remote_files' => { from: ['remote_files'], split: /\s*[|]\s*/},
      #   'resource_type' => { from: ['resource_type'], split: true },
      #   'rights_notes' => { from: ['rights_notes'], split: true },
      #   'source' => { from: ['source'], split: true },
      #   'subject' => { from: ['subject'], split: true },
      #   'title' => { from: ['title'], split: /\s*[|]\s*/ }
      # }
  
      default_field_mapping = {
        'abstract' => { from: ['dc.description.abstract[]', 'dc.description.abstract[en]', 'dc.description.abstract[en-US]'], split: /\s*[||]\s*/ },
        'advisor' => { from: ['dc.contributor.advisor[]', 'dc.contributor.advisor[en]', 'dc.contributor.advisor[en-US]'], split: /\s*[||]\s*/ },
        'creator' => { from: ['dc.creator[]','dc.creator[en]', 'dc.creator[en-US]'], split: /\s*[||]\s*/ },
        'contributor' => { from: ['dc.contributor.author[]', 'dc.contributor.author[en]', 'dc.contributor.author[en-US]'], split: /\s*[||]\s*/ },
        'date_created' => { from: ['dc.date.created[]', 'dc.date.created[en]'], split: /\s*[||]\s*/ },
        'date_issued' => { from: ['dc.date.issued', 'dc.date.issued[]', 'dc.date.issued[en]', 'dc.date.issued[en-US]'], split: /\s*[||]\s*/ },
        'description' => { from: ['dc.description[]', 'dc.description[en]', 'dc.description.sponsorship[en]'], split: /\s*[||]\s*/ },
        'embargo_date' => { from: ['gu.embargo.custom-date[]', 'gu.embargo.custom-date[en]', 'gu.embargo.custom-date[en-US]'], split: /\s*[||]\s*/ },
        'embargo_lift_date' => { from: ['gu.embargo.lift-date[]', 'gu.embargo.lift-date[en]','gu.embargo.lift-date[en-US]'], split: /\s*[||]\s*/ },
        'embargo_terms' => { from: ['gu.embargo.terms[en]'], split: /\s*[||]\s*/ },
        'extent' => { from: ['dc.format.extent[]', 'dc.format.extent[en]', 'dc.format.extent[en-US]'], split: /\s*[||]\s*/ },
        'format' => { from: ['dc.format[]', 'dc.format[en]', 'dc.format[en-US]'], split: /\s*[||]\s*/ },
        'file' => { from: ['file'], split: /\s*[||]\s*/ },
        'identifier' => { from: ['dc.identifier.uri', 'dc.identifier.uri[en]', 'dc.identifier.uri[en-US]'], split: /\s*[||]\s*/ },
        'is_part_of_series' => { from: ['dc.relation.ispartofseries[]', 'dc.relation.ispartofseries[en]', 'dc.relation.ispartofseries[en-US]'], split: /\s*[||]\s*/ },
        'keyword' => { from: ['dc.subject.other[]', 'dc.subject.other[en]', 'dc.subject.other[en-US]', 'dc.subject[]', 'dc.subject[en]', 'dc.subject[en-US]'], split: /\s*[||]\s*/ },
        'language' => { from: ['dc.language.iso[]', 'dc.language.iso[en]', 'dc.language.iso[en-US]', 'dc.language[]', 'dc.language[en]', 'dc.language[en-US]'], split: /\s*[||]\s*/ },
        'parents' => { from: ['collection'], related_parents_field_mapping: true },
        'orcid' => { from: ['dc.identifier.orcid[]', 'dc.identifier.orcid[en]', 'dc.identifier.orcid[en-US]'], split: /\s*[||]\s*/ },
        'provenance' => { from: ['dc.provenance[]', 'dc.provenance[en]', 'dc.provenance[en-US]'], split: /\s*[||]\s*/ },
        'publisher' => { from: ['dc.publisher[]', 'dc.publisher[en]', 'dc.publisher[en-US]'], split: /\s*[||]\s*/ },
        'resource_type' => { from: ['dc.type[]', 'dc.type[en]', 'dc.type[en-US]'], split: /\s*[||]\s*/ },
        'rights_notes' => { from: ['rights_notes'], split: /\s*[||]\s*/ },
        'source' => { from: ['dc.source[]', 'dc.source[en]', 'dc.source[en-US]'], split: /\s*[||]\s*/ },
        'source_identifier' => { from: ['id'], source_identifier: true },
        'subject' => { from: ['dc.subject.lcsh[]', 'dc.subject.lcsh[en]', 'dc.subject.lcsh[en-US]'], split: /\s*[||]\s*/ },
        'title' => { from: ['dc.title[]', 'dc.title[en]', 'dc.title[en-US]'], split: /\s*[||]\s*/ },
      }
  
      config.field_mappings["Bulkrax::BagitParser"] = default_field_mapping.merge({
        
      })
  
      config.field_mappings["Bulkrax::CsvParser"] = default_field_mapping.merge({
        
      })
  
      config.field_mappings["Bulkrax::OaiDcParser"] = default_field_mapping.merge({
        # add or remove custom mappings for this parser here
      })
  
      config.field_mappings["Bulkrax::OaiQualifiedDcParser"] = default_field_mapping.merge({
        # add or remove custom mappings for this parser here
      })
  
      config.field_mappings["Bulkrax::XmlParser"] = default_field_mapping.merge({
        # add or remove custom mappings for this parser here
      })
  
      # To duplicate a set of mappings from one parser to another
      #   config.field_mappings["Bulkrax::OaiOmekaParser"] = {}
      #   config.field_mappings["Bulkrax::OaiDcParser"].each {|key,value| config.field_mappings["Bulkrax::OaiOmekaParser"][key] = value }
  
      # Properties that should not be used in imports/exports. They are reserved for use by Hyrax.
      # config.reserved_properties += ['my_field']
    end
  
    Bulkrax::CreateRelationshipsJob.update_child_records_works_file_sets = true
  end
  