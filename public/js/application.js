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

  $('#nav-button-container').on('submit','#new-session-form',function(e){
    e.preventDefault();
    data = $(this).serialize();
    $.ajax({
      method: "POST",
      url: '/session',
      data: data
    })
    .done(function(response){
      console.log(response);
    })
    .fail(function(jsxhr){
      if ($('#new-session-form').has('#errors').length == 0) {
        $('#new-session-form').append(jsxhr.responseText);
      }
    })
  });
});
