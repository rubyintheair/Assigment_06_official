// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on("turbolinks:load", function() {
  $()



  $(".comment-button").click(function(){
    $(this).parents(".comment-icon").siblings(".footer-post").children(".comment-form").removeClass("hidden");
  });  
})


