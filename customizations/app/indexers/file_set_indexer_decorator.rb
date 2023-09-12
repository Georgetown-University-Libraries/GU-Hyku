# frozen_string_literal: true
module Hyrax
    module FileSetIndexerDecorator
      def generate_solr_document
        super.tap do |solr_doc|
          solr_doc['language_ssi'] = object.language.first if object.respond_to?(:language)
          solr_doc['language_code_ssi'] = translations.key(solr_doc['language_ssi']) if solr_doc['language_ssi'].present?
          solr_doc['video_id_ssi'] = object.id if object.video?
          solr_doc['vtt_id_ssi'] = object.id if object.mime_type == 'text/vtt'
        end
      end
  
      private
  
        def translations
          extend(Hyrax::HyraxHelperBehavior).available_translations
            # add more translations here
            .merge({
              "ja" => "日本語"
              })
        end
    end
  end
  
  Hyrax::FileSetIndexer.prepend(Hyrax::FileSetIndexerDecorator)