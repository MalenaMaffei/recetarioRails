class Instructions
    constructor: ->
        @instr_area = $("[data-behavior='instr_area']")
        @setup() if @instr_area.length > 0

    setup: ->
        if $('#instrHidden').val()
            @instrs = $('#instrHidden').val().split('</li><li>')
            # console.log("de coffeescript")
            # console.log(@instrs)
        else
            @instrs = []

        $.each @instrs, (i, instr) =>
            instr = instr.replace(/<li>|<\/li>/ig,'')
            @instrs[i] = instr
            @insert_instr(instr, i, $('#instrHidden')) if instr

        @insert_instr('', @instrs.length, $('#instrHidden'))

        # console.log("de coffeescript")
        # console.log(@instrs)
    #
    #     $("[data-behavior='ingredient_input']").on "focusout", @handleFocusout
    #     $("[data-behavior='ingredient_input']").on "keyup", @handleKeyup
    #
    #
    insert_instr: (instr, id, after) ->
        # $("<textarea/>",{text:instr.toLowerCase(), insertAfter:after, class:'form-control',  id: id}).on ({keydown: @handleKeydown, focusout: @handleFocusout})
        input = $("<textarea/>",{text: '', insertAfter:after, class:'form-control',  id: id}).on ({keyup: @handleKeyup})
        input.focus()

    #
    #
    #
    # handleClick: (e) =>
    #     console.log @ingredients
    #     tag = $(e.target).text()
    #     $(e.target).remove()
    #     i = @ingredients.indexOf(tag)
    #     console.log "tag: " + tag + " id: " + i
    #     @ingredients.splice(i, 1);
    #     @refresh()
    #
    handleKeyup: (e) =>
        console.log "handleKeydown"
        @newStep(e) if (/(13)/.test(e.which))
    #
    newStep: (e) ->
        step = e.target.value.replace(/^\s+|\s+$/g,'')
        # tag = tag.replace(/^\s+|\s+$/g,'');
        e.target.value = step
        if step
            console.log ("nievo step: " + step)
            id = @instrs.length
            @instrs.push(step)
            @refresh()
            @insert_instr(step, id, e.target)
        # e.target.value = ''

    #
    refresh: ->
        steps = []
        $.each @instrs, (i, step) ->
            steps.push(step)
        value = '<li>' + steps.filter(Boolean).join('</li><li>') + '</li>'
        console.log value
        $('#instrHidden').attr('value', value);
        console.log('ahora en hidden: '+$('#hiddenInput').val());

ready = ->
    new Instructions


$(document).on('turbolinks:load', ready)
