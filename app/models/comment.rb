class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	belongs_to :user
	has_ancestry
  
  default_scope  { order('updated_at DESC') }

  def send_update_email
    UpdatesMailer.new_comment_update(self.user,self.commentable.user,self).deliver
  end

  def send_update_email_reply
    UpdatesMailer.new_reply_update(self.user,self.parent.user,self).deliver
  end

end
