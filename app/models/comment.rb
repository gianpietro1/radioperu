class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	belongs_to :user

  default_scope  { order('updated_at DESC') }

  def send_update_email
    UpdatesMailer.new_comment_update(self.commentable.user,self).deliver
  end

end
