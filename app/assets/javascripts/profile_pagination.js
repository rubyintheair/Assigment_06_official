$(document).on("turbolinks:load", setupInfiniteScroll)

// just a dummy function for now. we will copy-and-paste a real function later
function setupInfiniteScroll(event) {
  $(window).on("scroll", function(e) {
    console.log("scrolling", e)
  })
}