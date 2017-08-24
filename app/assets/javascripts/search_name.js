var options = {
  url: function(name) {
    return "/users/search?q=" + name + "&format=json";
  },
  getValue: "name",

  template: {
        type: "links",
        fields: {
            link: "link"
        }
    },

    list: {
        match: {
            enabled: true
        }
    },

    theme: "bootstrap"
};

$(document).ready(function(){
  $("#provider-remote").easyAutocomplete(options)
});