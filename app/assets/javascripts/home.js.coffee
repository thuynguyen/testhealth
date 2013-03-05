window.homeObject = 
  setup: ->
    @activeTab()
    @changeLanguage()
    return 
  
  activeTab: ->
    current_tab = $("#current_tab").val()
    if current_tab == "directory"
      $(".active.temp").first().addClass("active_directory")
    else if current_tab == "inbox"
      $(".active.temp").first().addClass("active_inbox")
    else if current_tab == "message"
      $(".active.temp").first().addClass("active_message")
    else if current_tab == "leaderboard"
      $(".active.temp").first().addClass("active_leaderboard")
    return
  changeLanguage: ->
    $(".vn, .en").click ->
      lang = $(this).attr("class")
      $.ajax
        type: "GET"
        url: "/change_locale"
        data: {
                locale: lang
              }
        success: (res) ->
          url = document.URL;
          if lang == "vn" && url.indexOf("en") > 0
            window.location = url.replace("en", lang)
          else if lang == "en" && url.indexOf("vn") > 0
            window.location = url.replace("vn", lang)
          else 
            window.location.reload()
        failure: (res) ->
          return
      return
      
 

