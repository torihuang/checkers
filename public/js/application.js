$(document).ready(function(){

  if (window.location.pathname == '/') {
    $('nav').toggle();
    $('body').css('background-image', 'url(/imgs/backdrop.jpg)');
  }

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

  // $('body').on('click','#enter',function(e){
  //   $('body').css('background-image', 'none');
  //   $('body').css('background-color', '#222222');
  // })

  $('body').on('click','#logout',function(e){
    e.preventDefault();
    $.ajax({
      method: "DELETE",
      url: '/session'
    })
    .done(function(response) {
      window.location.href = "/"
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
      window.location.href = "/users/" + response.user_id;
    })
    .fail(function(jsxhr){
      if ($('#new-session-form').has('#errors').length == 0) {
        $('#new-session-form').append(jsxhr.responseText);
      }
    })
  });

  $('#nav-button-container').on('submit','#new-user-form',function(e){
    e.preventDefault();
    data = $(this).serialize();
    $.ajax({
      method: "POST",
      url: '/users',
      data: data
    })
    .done(function(response){
      console.log(response);
      window.location.href = "/users/" + response.user_id;
    })
    .fail(function(jsxhr){
      if ($('#new-user-form').has('#errors').length == 0) {
        $('#new-user-form').append(jsxhr.responseText);
      }
    })
  });
});
