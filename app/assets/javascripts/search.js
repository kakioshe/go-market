document.addEventListener("turbolinks:load", function() {
  $input = $('#term');
  var options = {
    getValue : "name",
    url: function(phrase){
      return "/search.json?q="+phrase;
    },
    categories: [
      {listLocation: "products", header: "<b>PRODUCTS<b>"},
      {listLocation: "categories", header: "<b>CATEGORIES<b>"}
    ],
    list: {
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url;
        $input.val("");
        Turbolinks.visit(url);
      }
    }
};
  $input.easyAutocomplete(options);
});
