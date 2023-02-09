$(document).ready(function() {
	$("#update").hide();
	$("#add").show();
	$("#delete").hide();

	$("#a").click(function(){
		$("#update").hide();
		$("#add").show();
	});
	$("#u").click(function(){
		$("#update").show();
		$("#add").hide();
		$("#delete").hide();
	});
	$("#d").click(function(){
		$("#update").hide();
		$("#add").hide();
		$("#delete").show();
	});
	
	$("#ad").click(function(){
	var flightno = document.getElementById("flightno2").value;	
	var airplaneid = document.getElementById("airplaneid2").value;	
	var departure = document.getElementById("departure2").value;	
	var dtime = document.getElementById("dtime2").value;	
	var arrival = document.getElementById("arrival2").value;	
	var atime = document.getElementById("atime2").value;	
	var ec = document.getElementById("ecapacity2").value;	
	var ep = document.getElementById("eprice2").value;	
	var bc = document.getElementById("bcapacity2").value;	
	var bp = document.getElementById("bprice2").value;	
	
	
	xmlhttp = new XMLHttpRequest();	
	xmlhttp.onreadystatechange = function() {
               if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var content = xmlhttp.responseText;
                
                if(content != "0"){
             	   alert(content);
             	}
            }
        }
        
        xmlhttp.open("GET","Adminadd.php?flightno="+flightno+"&airplaneid="+airplaneid+"&departure="+departure+"&dtime="+dtime+"&arrival="+arrival+"&atime="+atime+"&ec="+ec+"&ep="+ep+"&bc="+bc+"&bp="+bp,true);
        xmlhttp.send();      
        
	});


	$("#up").click(function(){
	var flightno = document.getElementById("flightno1").value;	
	var airplaneid = document.getElementById("airplaneid1").value;	
	var departure = document.getElementById("departure1").value;	
	var dtime = document.getElementById("dtime1").value;	
	var arrival = document.getElementById("arrival1").value;	
	var atime = document.getElementById("atime1").value;	
	var ec = document.getElementById("ecapacity1").value;	
	var ep = document.getElementById("eprice1").value;	
	var bc = document.getElementById("bcapacity1").value;	
	var bp = document.getElementById("bprice1").value;	

	xmlhttp = new XMLHttpRequest();	
	xmlhttp.onreadystatechange = function() {
               if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var content = xmlhttp.responseText;
                
                if(content != "0"){
             	   alert(content);
             	}
            }
        }
        xmlhttp.open("GET","Adminupdate.php?flightno="+flightno+"&airplaneid="+airplaneid+"&departure="+departure+"&dtime="+dtime+"&arrival="+arrival+"&atime="+atime+"&ec="+ec+"&ep="+ep+"&bc="+bc+"&bp="+bp,true);
        xmlhttp.send();      
        
	});

	$("#de").click(function(){
		var flightno = document.getElementById("flightno1").value;	
		xmlhttp = new XMLHttpRequest();	
		xmlhttp.onreadystatechange = function() {
               if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var content = xmlhttp.responseText;

                if(content != "0"){
             	   alert(content);
             	}
            }
        }
        
        xmlhttp.open("GET","Admindelete.php?flightno="+flightno,true);
        xmlhttp.send();      
	});
	
	$("#ad1").hover(function(){
		xmlhttp = new XMLHttpRequest();	
		xmlhttp.onreadystatechange = function() {
               if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var content = xmlhttp.responseText;
                	document.getElementById("detail").innerHTML = content;
             	 	$("#detail").show();
             	 	
            	}
        }
        
        xmlhttp.open("GET","Admindetail1.php",true);
        xmlhttp.send();      
	},  function(){
		$("#detail").hide();
	});
	
	$("#ud1").hover(function(){
		xmlhttp = new XMLHttpRequest();	
		xmlhttp.onreadystatechange = function() {
               if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var content = xmlhttp.responseText;
                	document.getElementById("detail1").innerHTML = content;
             	 	$("#detail1").show();
             	 	
            	}
        }
        
        xmlhttp.open("GET","Admindetail1.php",true);
        xmlhttp.send();      
	}, function(){
		$("#detail1").hide();
	});
	
	$("#ud2").hover(function(){
		xmlhttp = new XMLHttpRequest();	
		xmlhttp.onreadystatechange = function() {
               if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var content = xmlhttp.responseText;
                	document.getElementById("udetail2").innerHTML = content;
             	 	$("#udetail2").show();
             	 	
            	}
        }
        
        xmlhttp.open("GET","Admindetail2.php",true);
        xmlhttp.send();      
	}, function(){
		$("#udetail2").hide();
	});
	
	$("#ud3").hover(function(){
		xmlhttp = new XMLHttpRequest();	
		xmlhttp.onreadystatechange = function() {
               if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var content = xmlhttp.responseText;
                	document.getElementById("udetail3").innerHTML = content;
             	 	$("#udetail3").show();
             	 	
            	}
        }
        
        xmlhttp.open("GET","Admindetail2.php",true);
        xmlhttp.send();      
	}, function(){
		$("#udetail3").hide();
	});
	
	$("#ad2").hover(function(){
		xmlhttp = new XMLHttpRequest();	
		xmlhttp.onreadystatechange = function() {
               if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var content = xmlhttp.responseText;
                	document.getElementById("adetail2").innerHTML = content;
             	 	$("#adetail2").show();
             	 	
            	}
        }
        
        xmlhttp.open("GET","Admindetail2.php",true);
        xmlhttp.send();      
	}, function(){
		$("#adetail2").hide();
	});
	
	$("#ad3").hover(function(){
		xmlhttp = new XMLHttpRequest();	
		xmlhttp.onreadystatechange = function() {
               if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var content = xmlhttp.responseText;
                	document.getElementById("adetail3").innerHTML = content;
             	 	$("#adetail3").show();
             	 	
            }
        }
        
        xmlhttp.open("GET","Admindetail2.php",true);
        xmlhttp.send();      
	}, function(){
		$("#adetail3").hide();
	});
	
});