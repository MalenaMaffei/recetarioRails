class Notification < ApplicationRecord
    belongs_to :recipient, class_name: 'User'
    belongs_to :actor, class_name: 'User'
    belongs_to :notifiable, polymorphic: true

    scope :unread, -> { where(read_at: nil) }

    # n.read_at > Time.zone.now - 10.minutes devuelve true, porque la cosa aca estaria viva!
    scope :newest_first, -> { order("created_at DESC") }
    scope :active, -> { where(" read_at is null or read_at > ?", Time.zone.now - 10.minutes) }
end
