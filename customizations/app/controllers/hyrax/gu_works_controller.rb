# Generated via
#  `rails generate hyrax:work GuWork`
module Hyrax
  # Generated controller for GuWork
  class GuWorksController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::GuWork

    # Use this line if you want to use a custom presenter
    self.show_presenter = Hyrax::GuWorkPresenter
  end
end
