json.array! @notifications do |notification|
  # json.recipient notification.recipient
  # json.actor notification.actor

  json.unread !notification.read_at?
  json.template render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]



end
