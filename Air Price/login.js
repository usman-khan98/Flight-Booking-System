$(document).ready(function() {
  $("#old").hide();
  $("#new").show();

  xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
      var content = xmlhttp.responseText;

      if (content != "0") {
        $("#old").show();
        $("#new").hide();
        content = "Welcome " + content + "!";
        $("#wuser").text(content);
      } else {
        $("#old").hide();
        $("#new").show();
      }
    }
  }

  xmlhttp.open("GET", "home.php", true);
  xmlhttp.send();

  $("#logout").click(function() {
    location.href = "logout.php";
  });

  $("#history").click(function() {
    location.href = "showhistory.php";
  });

});
