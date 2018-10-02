$(document).ready(function () {

  $( function() {
    $( ".list-container" ).sortable({connectWith: ".list-container"});
    $('.list-container li').sortable({
      connectWith: ".list-container li",
      receive: function(event, ui) {
        var params = {};
        params['id'] = $(ui.item.context.firstElementChild).text().trim();
        params['state'] = $(this).find('.issue-state').text();
        updateIssueState(params);
      }
    });
  });

  function updateIssueState(params) {
    $.ajax({
      type: 'POST',
      url: '/update_state',
      data: params,
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      dataType: 'json',
      success: function(result) {
      }
    });
  }
});
