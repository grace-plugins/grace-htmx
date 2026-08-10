// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery.min
//= require bootstrap.bundle
//= require htmx
//= require sweetalert.min
//= require_self

document.addEventListener("htmx:confirm", function(e) {
    // The event is triggered on every trigger for a request, so we need to check if the element
    // that triggered the request has a confirm question set via the hx-confirm attribute,
    // if not we can return early and let the default behavior happen
    if (!e.detail.question) return;

    // This will prevent the request from being issued to later manually issue it
    e.preventDefault();

    Swal.fire({
      title: "Confirmation",
      text: `${e.detail.question}`
    }).then(function(result) {
      if (result.isConfirmed) {
        // If the user confirms, we manually issue the request
        e.detail.issueRequest(true); // true to skip the built-in window.confirm()
      }
    });
});
