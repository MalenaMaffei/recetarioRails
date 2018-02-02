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



# jQuery ->
class Notifications
    constructor: ->
        @notifications = $("[data-behavior='notifications']")
        # console.log(@notifications)
        @setup() if @notifications.length > 0
        # if @notifications.length > 0
        #   @handleSuccess @notifications.data("notifications")
        #   $("[data-behavior='notifications-link']").on "click", @handleClick
        #
        #   setInterval (=>
        #     @getNewNotifications()
        #   ), 5000


    # getNewNotifications: ->
    #     $.ajax(
    #       url: "/notifications.json"
    #       dataType: "JSON"
    #       method: "GET"
    #       success: @handleSuccess
    #     )


    setup: ->
        # console.log(@notifications)
        $("[data-behavior='notifications-link']").on "click", @handleClick
        $.ajax(
            url: "/notifications.json"
            dataType: 'JSON'
            method: "GET"
            success: @handleSuccess
        )




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

      unread_count = 0
      $.each data, (i, notification) ->
        if notification.unread
          unread_count += 1


      $("[data-behavior='notification-items']").append(items)
      $("[data-behavior='unread-count']").text("")
      if unread_count > 0
          $("[data-behavior='unread-count']").text(unread_count)


ready = ->
    new Notifications


$(document).on('turbolinks:load', ready)
