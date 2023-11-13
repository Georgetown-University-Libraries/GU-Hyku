# frozen_string_literal: true
module Hyrax
  module FileSetIndexerDecorator
    def generate_solr_document
      super.tap do |solr_doc|
        solr_doc['all_text_timv'] = solr_doc['all_text_tsimv'] = pdf_text
        solr_doc['language_ssi'] = object.language.first if object.respond_to?(:language)
        solr_doc['language_code_ssi'] = translations.key(solr_doc['language_ssi']) if solr_doc['language_ssi'].present?
        solr_doc['video_id_ssi'] = object.id if object.video?
        solr_doc['vtt_id_ssi'] = object.id if object.mime_type == 'text/vtt'
      end
    end

    private

      def pdf_text
        return unless object.pdf?
        return unless object.original_file&.content.is_a? String

        text = IO.popen(['pdftotext', '-', '-'], 'r+b') do |pdftotext|
          pdftotext.write(object.original_file.content)
          pdftotext.close_write
          pdftotext.read
        end

        text.tr("\n", ' ')
            .squeeze(' ')
            .encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '') # remove non-UTF-8 characters
      end

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