
	$("li a").click(function(event){
	event.preventDefault();
	if($(this).data('seleccion')!=null){
	$("#contenedor").load($(this).data('seleccion')+'.jsp');
	}
	});
function ajustarPie() {
	  var winH = $(window).height();
	  var docH = $("body").height();
	  var pieH = $("footer").height();
	  
	  if (docH + pieH < winH) {
	    $("footer").attr("class", "bottom");
	    } else {
	      $("footer").attr("class", "");
	      }
	  }

	$(document).ready(ajustarPie);
	$(window).on("resize", ajustarPie);
	
function myFunction() {
	  // Declare variables 
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("seleccion");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	 
	  for (i = 0; i <  tr.length; i++) {
		  
	    td = tr[i].getElementsByTagName("td")[5];
	    if(filter==="0"){
	    	 tr[i].style.display = "";
	    
	    }else {
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	        
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
	    }
	  }
	   
	}
function myFunction1() {
	  // Declare variables 
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput1");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	
	  for (i = 0; i <  tr.length; i++) {
		  
	    td = tr[i].getElementsByTagName("td")[6];
	    if(filter==="0"){
	    	 tr[i].style.display = "";
	    
	    }else {
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	        
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
	    
	  }
	  }
	  
	}
function myFunction2() {
	  // Declare variables 
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput2");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	 
	  for (i = 0; i <  tr.length; i++) {
		  
	    td = tr[i].getElementsByTagName("td")[3];
	    if(filter==="0"){
	    	 tr[i].style.display = "";
	    
	    }else {
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	        
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
	    }
	  }
	   
	}
function openApuesta(apuestaName) {
    var i;
    var x = document.getElementsByClassName("apuesta");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    document.getElementById(apuestaName).style.display = "block";  
}
