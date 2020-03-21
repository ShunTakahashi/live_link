$(document).on('turbolinks:load',function() {
  document.getElementById('search_date_gteq').onchange = default_date;
});

function default_date() {
  lteq_date = document.getElementById('search_date_gteq').value;
  document.getElementById('search_date_lteq').value = lteq_date;
};