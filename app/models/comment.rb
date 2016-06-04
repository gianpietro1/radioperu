class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	belongs_to :user
	has_ancestry
  
  default_scope  { order('updated_at DESC') }

  def send_update_email
    unless self.commentable_type == 'Playlist'
      UpdatesMailer.delay(run_at: 10.seconds.from_now).new_comment_update(self.user,self.commentable.user,self)
    else
      UpdatesMailer.delay(run_at: 10.seconds.from_now).new_comment_playlist_update(self.user,self.commentable.user,self)
    end
  end

  def send_update_email_reply
    UpdatesMailer.delay(run_at: 10.seconds.from_now).new_reply_update(self.user,self.parent.user,self)
  end

end
