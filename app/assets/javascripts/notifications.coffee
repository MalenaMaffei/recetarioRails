# $ ->
#   class Notifications
#     constructor: ->
#       @getNewNotifications()
#       @notifications = $("[data-behavior='notifications']")
#
#       if @notifications.length > 0
#         @handleSuccess @notifications.data('notifications')
#
#     getNewNotifications: ->
#       $.ajax(
#         url: '/notifications.json'
#         dataType: 'JSON'
#         method: 'GET'
#         success: @handleSuccess
#       )
#
#     handleSuccess: (data) =>
#       items = $.map data, (notification) ->
#         notifications.template
#
#       $("[data-behavior='unread-count']").text(items.length)
#       $("[data-behavior='notification-items']").append(items)




class Notifications
    constructor: ->
        @notifications = $("[data-behavior='notifications']")
        # @setup() if @notifications.length > 0
        if @notifications.length > 0
          @handleSuccess @notifications.data("notifications")
          $("[data-behavior='notifications-link']").on "click", @handleClick

          setInterval (=>
            @getNewNotifications()
          ), 5000


      getNewNotifications: ->
        $.ajax(
          url: "/notifications.json"
          dataType: "JSON"
          method: "GET"
          success: @handleSuccess
        )
    # setup: ->
    #     # console.log(@notifications)
    #     $("[data-behavior='notifications-link']").on "click", @handleClick
    #     $.ajax(
    #         url: "/notifications.json"
    #         dataType: 'JSON'
    #         method: "GET"
    #         success: @handleSuccess
    #     )

    handleClick: (e) =>
        $.ajax(
          url: "/notifications/mark_as_read"
          dataType: "JSON"
          method: "POST"
          success: ->
            $("[data-behavior='unread-count']").text("")
    )

    handleSuccess: (data) =>
        # console.log(data)
      items = $.map data, (notification) ->
          notification.template

      $("[data-behavior='notification-items']").append(items)
      $("[data-behavior='unread-count']").text("")
      if items.length > 0
          $("[data-behavior='unread-count']").text(items.length)



jQuery ->
    new Notifications
