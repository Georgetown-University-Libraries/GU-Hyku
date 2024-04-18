module Hyrax
  class HandlesController < ApplicationController
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    #self.curation_concern_type = ::GuWork

    def id
      resp = Hyrax::SolrService.get("handle_tesim: #{params[:handle]}")
      solr_hash = resp.dig("response", "docs", 0)
      @id = solr_hash["id"] unless solr_hash.blank?
    end
    
    # def work_type
    #   Hyrax.config.registered_curation_concern_types.each do |type|
    #     relation = type.constantize.where(handle: params[:handle])
    #     if relation.present?
    #       @work_type = relation.first.model_name.name
    #     end
    #   end
    #   @work_type
    # end

    # def presenter_class
    #   # TODO: rescue NameError?
    #   "Hyrax::#{self.curation_concern_type}Presenter".constantize
    # end

    #self.show_presenter = Hyrax::GuWorkPresenter
      
    # Finds a solr document matching the id and sets @presenter
    # @raise CanCan::AccessDenied if the document is not found or the user doesn't have access to it.
    def show
      @user_collections = user_collections
      @id = id
      return redirect_to root_path, alert: "Record with handle suffix '#{params[:handle]}' does not exist" if id.nil?
      respond_to do |wants|
        wants.html { presenter && parent_presenter }
        wants.json do
          # load @curation_concern manually because it's skipped for html
          @curation_concern = Hyrax.query_service.find_by(alternate_identifier: @id)
          curation_concern # This is here for authorization checks (we could add authorize! but let's use the same method for CanCanCan)
          render :show, status: :ok
        end
        additional_response_formats(wants)
        wants.ttl { render body: presenter.export_as_ttl, mime_type: Mime[:ttl] }
        wants.jsonld { render body: presenter.export_as_jsonld, mime_type: Mime[:jsonld] }
        wants.nt { render body: presenter.export_as_nt, mime_type: Mime[:nt] }
      end
    end

    def presenter
      @id = id
      @presenter ||= show_presenter.new(search_result_document(id: @id), current_ability, request)
    end

    def document_not_found!
      @id = id
      doc = ::SolrDocument.find(@id)
      raise WorkflowAuthorizationException if doc.suppressed? && current_ability.can?(:read, doc)
      raise CanCan::AccessDenied.new(nil, :show)
    end

    def unavailable_presenter
      @id = id
      @presenter ||= show_presenter.new(::SolrDocument.find(@id), current_ability, request)
    end
  end
end
