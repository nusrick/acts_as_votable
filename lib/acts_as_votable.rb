require 'active_record'
require 'active_support/inflector'
require_relative 'acts_as_votable/config'

$LOAD_PATH.unshift(File.dirname(__FILE__))

module ActsAsVotable

  if defined?(ActiveRecord::Base)
    require 'acts_as_votable/extenders/votable'
    require 'acts_as_votable/extenders/voter'
    require 'acts_as_votable/like_item'

    ActiveRecord::Base.extend ActsAsVotable::Extenders::Votable
    ActiveRecord::Base.extend ActsAsVotable::Extenders::Voter
  end

end

require 'acts_as_votable/extenders/controller'
ActiveSupport.on_load(:action_controller) do
  include ActsAsVotable::Extenders::Controller
end