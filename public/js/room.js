$(document).ready(function(){
  if (window.location.href.match(/\/(users)\/\d+\/(rooms)\/\d+/)) {
    var url_array = window.location.href.split('/');
    room_id = url_array[url_array.length - 1];
    console.log(url_array[url_array.length - 1]);
    console.log(room_id);
    $.ajax({
      method: "GET",
      url: "/rooms/" + room_id + "/items"
    })
    .done(function(response){
      $.each(response,function(item_id, values){
        image = "<img src='" + values.image_path + "' class='item-image' id='item-image-"+ item_id +"'>";
        console.log(image);
        $('#palace-show').append(image);
        console.log(values.location[0]);
        console.log(values.location[1]);
        $("#item-image-" + item_id).css('left', values.location[0]);
        $("#item-image-" + item_id).css('top', values.location[1]);
        // console.log(values);
      })
    })
  }
})
