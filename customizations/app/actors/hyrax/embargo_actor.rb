# frozen_string_literal: true
module Hyrax
  module Actors
    class EmbargoActor
      attr_reader :work

      # @param [Hydra::Works::Work] work
      def initialize(work)
        @work = work
      end

      # Update the visibility of the work to match the correct state of the embargo, then clear the embargo date, etc.
      # Saves the embargo and the work
      def destroy
        case work
        when Valkyrie::Resource
          embargo_manager = Hyrax::EmbargoManager.new(resource: work)
          embargo_manager.release && Hyrax::AccessControlList(work).save
          embargo_manager.nullify
        else
          # work.embargo_visibility! # If the embargo has lapsed, update the current visibility.
        
          # Hydra::AccessControls::Embargoable#embargo_visibility! sets visibility 
          # to visibility_during_embargo rather than the expected visibility_after_embargo
          # https://github.com/samvera/hydra-head/blob/v11.0.7/hydra-access-controls/app/models/concerns/hydra/access_controls/embargoable.rb#L51
          # so the following line is required
          work.visibility = work.visibility_after_embargo
          work.deactivate_embargo!
          work.embargo.save!
          work.save!
        end
      end
    end
  end
end