# frozen_string_literal: true

module Bulkrax
    module Metadata
      extend ActiveSupport::Concern
  
      included do
        #TODO: Replace repository.libary.georgetown.edu with new DG domain (once live)
        property :bulkrax_id, predicate: ::RDF::URI.new("http://repository.library.georgetown.edu/ns#bulkrax_id"), multiple: false do |index|
          index.as :stored_searchable
        end
      end
    end
  end