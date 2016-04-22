class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	belongs_to :user

  default_scope  { order('updated_at DESC') }

end
