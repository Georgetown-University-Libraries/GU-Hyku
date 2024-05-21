# frozen_string_literal: true

# OVERRIDE here to add featured collection methods and to delegate collection presenters to the member presenter factory

module Hyku
  class WorkShowPresenter < Hyrax::WorkShowPresenter
    Hyrax::MemberPresenterFactory.file_presenter_class = Hyrax::FileSetPresenter


    delegate :title_or_label, :extent, to: :solr_document

    # OVERRIDE Hyrax v2.9.0 here to make featured collections work
    delegate :collection_presenters, to: :member_presenter_factory

    # assumes there can only be one doi
    def doi
      doi_regex = %r{10\.\d{4,9}\/[-._;()\/:A-Z0-9]+}i
      doi = extract_from_identifier(doi_regex)
      doi&.join
    end

    # unlike doi, there can be multiple isbns
    def isbns
      isbn_regex = /((?:ISBN[- ]*13|ISBN[- ]*10|)\s*97[89][ -]*\d{1,5}[ -]*\d{1,7}[ -]*\d{1,6}[ -]*\d)|
                    ((?:[0-9][-]*){9}[ -]*[xX])|(^(?:[0-9][-]*){10}$)/x
      isbns = extract_from_identifier(isbn_regex)
      isbns&.flatten&.compact
    end

    # OVERRIDE here for featured collection methods
    # Begin Featured Collections Methods
    def collection_featurable?
      user_can_feature_collection? && solr_document.public?
    end

    def display_feature_collection_link?
      collection_featurable? && FeaturedCollection.can_create_another? && !collection_featured?
    end

    def display_unfeature_collection_link?
      collection_featurable? && collection_featured?
    end

    def collection_featured?
      # only look this up if it's not boolean; ||= won't work here
      if @collection_featured.nil?
        @collection_featured = FeaturedCollection.where(collection_id: solr_document.id).exists?
      end
      @collection_featured
    end

    def page_title
      "#{title.first} | #{I18n.t('hyrax.product_name')}"
    end

    def user_can_feature_collection?
      current_ability.can?(:create, FeaturedCollection)
    end
    # End Featured Collections Methods

    def video_file_set_presenter
      file_set_presenters.find(&:video?)
    end
    
    def vtt_file_set_presenters
      file_set_presenters.select(&:vtt?)
    end

    # retrieves and structures in an array ancestor (including parent) collection names and ids
    def ancestor_collections
      if member_of_collection_ids
        ancestor_titles_and_ids = []
        member_of_collection_ids.each { |parent_id|
          doc = Hyrax::SolrService.get("id: #{parent_id}").dig("response", "docs", 0)
          if doc
            ancestor_id = doc["member_of_collection_ids_ssim"]&.first
            title = doc["title_tesim"]&.first
            ids = [[title, parent_id]]
            if ancestor_id
              while ancestor_id 
                doc = Hyrax::SolrService.get("id: #{ancestor_id}").dig("response", "docs", 0)
                if doc
                  title = doc["title_tesim"]&.first
                  ids.prepend([title, ancestor_id]) if ancestor_id
                  ancestor_id = doc["member_of_collection_ids_ssim"]&.first
                else
                  ancestor_id = false
                end
              end
            end
            ancestor_titles_and_ids.prepend(ids)
          end 
        } 
        ancestor_titles_and_ids
      end
    end

    private

      def extract_from_identifier(rgx)
        if solr_document['identifier_tesim'].present?
          ref = solr_document['identifier_tesim'].map do |str|
            str.scan(rgx)
          end
        end
        ref
      end
  end
end

