# Generated via
#  `rails generate hyrax:work Guetd`
module Hyrax
  # Generated controller for Guetd
  class GuetdsController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::Guetd

    # Use this line if you want to use a custom presenter
    self.show_presenter = Hyrax::GuetdPresenter
  end
end
