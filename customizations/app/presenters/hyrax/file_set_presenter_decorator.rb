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

    def extent
      if solr_document.duration
        time_to_words(solr_document.duration&.first)
      elsif solr_document.page_count
        "#{solr_document.page_count&.first} pages"
      elsif solr_document.width && solr_document.height
        "#{solr_document.width}×#{solr_document.height} pixels"
      else
        "--"
      end
    end

    def time_to_words(time_str)
      # Parse time string into hours, minutes, and seconds
      hours, minutes, seconds = time_str.split(':').map(&:to_i)
    
      components = []
    
      components << "#{hours} hours" if hours > 0
    
      components << "#{minutes} minutes" if minutes > 0
    
      components << "#{seconds} seconds" if seconds > 0
    
      result = components.join(', ')
    
      # Format the result
      result
    end

    def language_code
      solr_document.language_code
    end
  end
end

Hyrax::FileSetPresenter.prepend(Hyrax::FileSetPresenterDecorator)