# frozen_string_literal: true

# OVERRIDE Hyrax v3.5.0 to add in import flag

module Hyrax
    module Actors
      module EnvironmentDecoractor
        # @param [ActiveFedora::Base] curation_concern work to operate on
        # @param [Ability] current_ability the authorizations of the acting user
        # @param [ActionController::Parameters] attributes user provided form attributes
        def initialize(curation_concern, current_ability, attributes, importing = false)
          @importing = importing
          super(curation_concern, current_ability, attributes)
        end
  
        attr_reader :importing
      end
    end
  end
  
  Hyrax::Actors::Environment.prepend(Hyrax::Actors::EnvironmentDecoractor)