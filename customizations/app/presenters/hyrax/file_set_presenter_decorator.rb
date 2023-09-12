# frozen_string_literal: true

# OVERRIDE Hyrax 3.5.0, seems to be needed for :vtt? and :language_code to work from the SolrDocument
module Hyrax
    module FileSetPresenterDecorator
      def vtt?
        solr_document.vtt?
      end
  
      def language_code
        solr_document.language_code
      end
    end
  end
  
  Hyrax::FileSetPresenter.prepend(Hyrax::FileSetPresenterDecorator)