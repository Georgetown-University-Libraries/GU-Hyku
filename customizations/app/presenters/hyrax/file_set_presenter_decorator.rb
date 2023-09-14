# frozen_string_literal: true

module Hyrax
  module FileSetPresenterDecorator
    include ActionView::Helpers::NumberHelper
    
    # Formats the bytes in file_size into a more understandable representation (e.g., giving it 1500 yields 1.5 KB)
    def file_size
      number_to_human_size(solr_document.file_size, precision: 2)
    end

    def vtt?
      solr_document.vtt?
    end

    def language_code
      solr_document.language_code
    end
  end
end

Hyrax::FileSetPresenter.prepend(Hyrax::FileSetPresenterDecorator)