class Comment < ApplicationRecord
    belongs_to :recipe
    belongs_to :user

    after_create :create_notifications


    private

    def recipients
      users = []
      self.recipe.comments.each do |comment|
        unless self.user == comment.user
          users << comment.user
        end
      end
      unless self.recipe.user == self.user
          users << self.recipe.user
      end

      return users.uniq
    end

    def create_notifications
      recipients.each do |recipient|
        Notification.create(recipient: recipient, actor: self.user,
                            action: 'posted', notifiable: self)
      end
    end
end
