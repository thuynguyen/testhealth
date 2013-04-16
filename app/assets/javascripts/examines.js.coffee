window.examineObject =
  setup: ->
    @accordingPrice()
    @datePicker()
    @selectTypes()
    @import()

  accordingPrice: -> 
    $("div").delegate ".collection", "change",  -> 
      type = parseInt($(this).val())
      input = $(this).parent().parent().siblings().find("input")
      console.log input
      switch type
        when 1 then input.attr("value", 50)
        when 2 then input.attr("value", 120)
        when 3 then input.attr("value", 60)
        when 4 then input.attr("value", 150)
        when 5 then input.attr("value", 50)
        when 6 then input.attr("value", 60)
        when 7 then input.attr("value", 60)
        when 8 then input.attr("value", 80)
        when 9 then input.attr("value", 70)
        when 10 then input.attr("value", 40)
        when 11 then input.attr("value", 40)
        when 12 then input.attr("value", 300)
  
  datePicker: ->
    $('.datepicker').datepicker()

  selectTypes: ->
    $("#examine_types").change ->
      type = $(this).val()
      $.ajax
        url: "/patients"
        type: "GET"
        data: 
          type: type

        success: (res)->
          console.log("success"+res)
          $("#list-patients").html(res)
        failure: ->
      return

  import: ->
    $("#link-import").click ->
      $("#import_modal").modal('show')

    $("#btn-import").click ->
      $("#form-import").submit()
      console.log 54545
    return
          
