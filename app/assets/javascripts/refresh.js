$(document).ready(function () {
  setInterval(refreshPartial, 30000)
});

function refreshPartial() {
  id = window.location.pathname.split("/").slice(-1).pop();
  $.ajax({
    url: "/ovens/" + id + "/refresh"
  })
}
