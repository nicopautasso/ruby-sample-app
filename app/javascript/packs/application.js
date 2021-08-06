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
    placeholder: "Busque producto por ID o nombre",
    allowClear: true,
    theme: "bootstrap"
  });
})
