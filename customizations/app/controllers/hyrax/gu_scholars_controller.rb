# Generated via
#  `rails generate hyrax:work GuScholar`
module Hyrax
  # Generated controller for GuScholar
  class GuScholarsController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::GuScholar

    # Use this line if you want to use a custom presenter
    self.show_presenter = Hyrax::GuScholarPresenter
  end
end
