# Generated via
#  `rails generate hyrax:work Guetd`
module Hyrax
  module Actors
    class GuetdActor < Hyrax::Actors::BaseActor
      # Assigns handle, when missing, according to first HandleCount record
      def create(env)
        if env.attributes.with_indifferent_access[:handle].blank?
          env.curation_concern.handle = ::HandleCount.first.increment_count.to_s
        end
        super
      end
    end
  end
end
  