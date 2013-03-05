window.homeObject = 
  setup: ->
    @activeTab()
    @changeLanguage()
    @showSlides()
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
          url = document.URL
          url_split = url.split("com")
          contain_lang = url_split[1]
          if lang == "vn" && contain_lang.indexOf("en") > 0
            window.location = [url_split[0], contain_lang.replace("en", lang)].join("com")
          else if lang == "en" && contain_lang.indexOf("vn") > 0
            window.location = [url_split[0], contain_lang.replace("vn", lang)].join("com")
          else 
            window.location.reload()
        failure: (res) ->
          return
      return
  showSlides: -> 
    $("#slides").slides
      preload: true
      preloadImage: "img/loading.gif"
      play: 5000
      pause: 2500
      hoverPause: true
      animationStart: (current) ->
        $(".caption").animate
          bottom: -35
        , 100
        
        # example return of current slide number
        console.log "animationStart on slide: ", current  if window.console and console.log

      animationComplete: (current) ->
        $(".caption").animate
          bottom: 0
        , 200
        
        # example return of current slide number
        console.log "animationComplete on slide: ", current  if window.console and console.log

      slidesLoaded: ->
        $(".caption").animate
          bottom: 0
        , 200

      
 

