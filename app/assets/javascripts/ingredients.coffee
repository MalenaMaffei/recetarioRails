class Ingredients
    constructor: ->
        @ingredients_area = $("[data-behavior='ingredients_area']")
        @setup() if @ingredients_area.length > 0

    setup: ->
        if $('#hiddenInput').val()
            @ingredients = $('#hiddenInput').val().split(',')
            console.log("de coffeescript")
            console.log(@ingredients)
        else
            @ingredients = []

        $.each @ingredients, (i, ingredient) =>
            @insert_badge(ingredient) if ingredient

        $("[data-behavior='ingredient_input']").on "focusout", @handleFocusout
        $("[data-behavior='ingredient_input']").on "keyup", @handleKeyup


    insert_badge: (ingredient) ->
        $("<span/>",{text:ingredient.toLowerCase(), insertBefore:$("#tagInput"), class:'badge badge-primary badge-pill'}).on "click", @handleClick



    handleClick: (e) =>
        console.log @ingredients
        tag = $(e.target).text()
        $(e.target).remove()
        i = @ingredients.indexOf(tag)
        console.log "tag: " + tag + " id: " + i
        @ingredients.splice(i, 1);
        @refresh()

    handleKeyup: (e) =>
        console.log "keyup"
        @handleFocusout(e) if (/(188|13)/.test(e.which))

    handleFocusout: (e) =>
        tag = e.target.value.replace(/[,;]/ig,'')
        tag = tag.replace(/^\s+|\s+$/g,'');
        if tag
            @insert_badge(tag)
            @ingredients.push(tag)
            @refresh()
        e.target.value = ''

        console.log (tag)

    refresh: ->
        tags = []
        $.each @ingredients, (i, ingredient) ->
            tags.push(ingredient)
        $('#hiddenInput').attr('value', tags.join(','));
        console.log('ahora en hidden: '+$('#hiddenInput').val());

ready = ->
    new Ingredients


$(document).on('turbolinks:load', ready)
