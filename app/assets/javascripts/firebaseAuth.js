$(document).ready(function(){
  $('#login-button').on('click', function(e) {

    e.preventDefault();
    console.log("prevent this shit");

    googleAuth().then(function(aData){
      $auth_id = aData.uid;
      $user_name = aData.google.displayName;
      bindForm();
      bindUpdates();
      bindDestruction();

      $.ajax({
        type: "POST",
        url: '/create',
        data: { "auth_id": $auth_id, "name": $user_name },
      }).done(function(resp){
        $("#card").css("display", "block")
        $("#card").append(resp)
        $("#index-salmon").empty()
        $("#index-bowl").empty()
        $("#index-onion").empty()
        $(".cycle-circles").empty()
        // $("#login-button").empty()
        // $("#login-button").css("background-color", "transparent")
        $("#login-button").css('display', 'none')
        $("header").css("background-color", "#43A047")
        $("footer").css("background-color", "#43A047")
        // $("body").css("background-image", "url()")
        $("body").css("background-color", "#ECEFF1")
      })
    })
  });
})

var bindForm = function(){
  $(document).on('click', ':submit#addButton', function(e){
    e.preventDefault();
    addItem(e);
  })
}

var bindUpdates = function(){
  $(document).on('click', '.checkbox-icon', function(e){
    e.preventDefault();
    var checkbox = $(e.target)
    var card = $(e.target).closest('.item-card')
    var id = $(e.target).closest('.item-card').attr('id')
    var update = $.ajax({
      url: "/itemsusers/" + id,
      type: "PUT"
    })
    update.done(function(response){
      // console.log(response)
      checkbox.attr('class', "fa fa-check-square-o fa-lg checkbox-icon")
      checkbox.attr('style', 'color:#43A047')
      // debugger
    })
  })
}

var bindDestruction = function(){
  $(document).on('click', '.delete-icon', function(e){
    e.preventDefault
    var card = $(e.target).closest('.item-card')
    var id = $(e.target).closest('.item-card').attr('id')
    var destroy = $.ajax({
      url: "/itemsusers/" + id,
      type: "DELETE"
    })
    destroy.done(function(response){
      card.remove();
    })
  })
}

// bindForm($('some-submit-css'));

function addItem(event){
  var form = $('#addForm');
  var data = form.serialize();
  // console.log(data);
  // var category = args.category
  // var description =
  // var name =
  $.ajax({
    url: "/items",
    type: "POST",
    data: data//{"name": $name, "description": $description, "category": $category}
  })
  .done(function(response){
    // console.log(response);
    $("#name-field").val("")
    $("#description-field").val("")
    $("#category-field").val("")
    $('.item-cards-list').append(response)
    var newCard = $('.item-cards-list').children().last()
    var data = { id: newCard.attr('id') }
    $.ajax({
      url: "/itemsusers",
      type: "POST",
      data: data
    }).done(function(response){
      // console.log(response)
    })
  })
}

function googleAuth(){
  var promise = new Promise(function(resolve, reject){
    var ref = new Firebase("https://sdg.firebaseio.com");
    ref.authWithOAuthPopup("google", function(error, authData) {
      if (error) {
        console.log("Login Failed!", error);
        reject(error)
      } else {
        resolve(authData)
      };
    })

  })
  return promise;
}







