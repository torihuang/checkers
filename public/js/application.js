$(document).ready(function(){
  $('body').on('click','#login',function(e){
    e.preventDefault();
    $.ajax({
      method: "GET",
      url: '/session/new'
    })
    .done(function(response) {
      if ($('#nav-button-container').has('#new-session-form').length > 0) {
        console.log('remove');
        $('#new-session-form').remove();
      }
      else {
        console.log('add');
        $('#nav-button-container').append(response);
      }
    })
  })

  $('body').on('click','#signup',function(e){
    e.preventDefault();
    $.ajax({
      method: "GET",
      url: '/users/new'
    })
    .done(function(response) {
      if ($('#nav-button-container').has('#new-user-form').length > 0) {
        console.log('remove');
        $('#new-user-form').remove();
      }
      else {
        console.log('add');
        $('#nav-button-container').append(response);
      }
    })
  })
});
