module ActsAsVotable
  extend self

  def enable_protected_attributes!
    ActsAsVotable::Vote.class_eval do
      attr_accessible :votable, :voter, :vote_scope
    end
  end

  def setup(&block)
    instance_eval(&block)
  end
end