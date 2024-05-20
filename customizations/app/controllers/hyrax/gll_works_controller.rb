# Generated via
#  `rails generate hyrax:work GllWork`
module Hyrax
  # Generated controller for GllWork
  class GllWorksController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::GllWork

    # Use this line if you want to use a custom presenter
    self.show_presenter = Hyrax::GllWorkPresenter
  end
end
