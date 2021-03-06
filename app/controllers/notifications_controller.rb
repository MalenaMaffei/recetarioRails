class NotificationsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_notifications

  def index
  end

  def mark_as_read
      @notifications.update_all(read_at: Time.zone.now.in_time_zone('Buenos Aires'))
      render json: {success: true}
  end

  private

  def set_notifications
    # @notifications = Notification.where(recipient: current_user).unread
    @notifications =  Notification.where(recipient: helpers.current_user).active.newest_first

  end

end
