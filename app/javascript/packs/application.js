// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "channels"
import "jquery"
import "bootstrap"
import "select2"

document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
        $('.dropdown-toggle').dropdown()
    })
})

$(document).ready(function() {
  $('#products_finder').select2({
    placeholder: "Busque producto por ID, nombre o descripcion",
    allowClear: true,
    theme: "bootstrap",
    matcher: function(params, data) {
        // If there are no search terms, return all of the data
        if ($.trim(params.term) === '') { return data; }

        // Do not display the item if there is no 'text' property
        if (typeof data.text === 'undefined') { return null; }

        // `params.term` is the user's search term
        // `data.id` should be checked against
        // `data.text` should be checked against
        var q = params.term.toLowerCase();
        if (data.text.toLowerCase().indexOf(q) > -1 || data.id.toLowerCase().indexOf(q) > -1 ) {
            return $.extend({}, data, true);
        }

        // Return `null` if the term should not be displayed
        return null;
    }


  });
})
