# frozen_string_literal: true

#redirect to handle URLs
module Hyrax
  module WorksControllerBehaviorDecorator
    
    def after_create_response
      respond_to do |wants|
        wants.html do
          # Calling `#t` in a controller context does not mark _html keys as html_safe
          flash[:notice] = view_context.t('hyrax.works.create.after_create_html', application_name: view_context.application_name)

          redirect_to "/handle/#{ENV.fetch('HANDLE_PREFIX', '10822')}/#{curation_concern.handle}"
        end
        wants.json { render :show, status: :created, location: polymorphic_path([main_app, curation_concern]) }
      end
    end

    def after_update_response
      return redirect_to hyrax.confirm_access_permission_path(curation_concern) if permissions_changed? && concern_has_file_sets?

      respond_to do |wants|
        wants.html { redirect_to "/handle/#{ENV.fetch('HANDLE_PREFIX', '10822')}/#{curation_concern.handle}", notice: "Work \"#{curation_concern}\" successfully updated." }
        wants.json { render :show, status: :ok, location: polymorphic_path([main_app, curation_concern]) }
      end
    end    
  end
end

Hyrax::WorksControllerBehavior.prepend(Hyrax::WorksControllerBehaviorDecorator)