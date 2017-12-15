<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../top.jsp" charEncoding="utf-8" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

.w3-sidebar {
  z-index: 3;
  width: 250px;
  top: 43px;
  bottom: 0;
  height: inherit;
}
</style>


<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px; margin-top:100px">

  <!-- First Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center" id="food" onclick="location.href='sns?name=admin'">
    <div class="w3-quarter">
      <img src="resources/img/00503214_20171106.JPG" alt="Sandwich" style="width:100%">
      <h3>admin</h3>
      <p>Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="resources/img/a.jpg" alt="Steak" style="width:100%">
      <h3>Let Me Tell You About This Steak</h3>
      <p>Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="resources/img/aaa.jpg" alt="Cherries" style="width:100%">
      <h3>Cherries, interrupted</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
      <p>What else?</p>
    </div>
    <div class="w3-quarter">
      <img src="resources/img/iumain.jpg" alt="Pasta and Wine" style="width:100%">
      <h3>Once Again, Robust Wine and Vegetable Pasta</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
  </div>
  
  <!-- Second Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center">
    <div class="w3-quarter">
      <img src="resources/img/00503214_20171106.JPG" alt="Popsicle" style="width:100%">
      <h3>All I Need Is a Popsicle</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="resources/img/00503214_20171106.JPG" alt="Salmon" style="width:100%">
      <h3>Salmon For Your Skin</h3>
      <p>Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="resources/img/stars.jpg" alt="Sandwich" style="width:100%">
      <h3>The Perfect Sandwich, A Real Classic</h3>
      <p>Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="resources/img/00503214_20171106.JPG" alt="Croissant" style="width:100%">
      <h3>Le French</h3>
      <p>Lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
  </div>

  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
  </div>
  
  <!-- About Section -->
  <div class="w3-container w3-padding-32 w3-center">  
    <h3>
Song recommendation</h3><br>
    <iframe width="854" height="480" src="https://www.youtube.com/embed/BzYnNdJhZQw" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    <div class="w3-padding-32">
      <h4><b>Through the Night</b></h4>
      <h6><i>IU</i></h6>
	<p>
Through the night

Tonight, I’ll send the glow of a firefly<br>
to somewhere near your window<br>
It’s that I love you<br>
I remember our first kiss<br>
I close my eyes whenever I can<br>
and go to the farthest place<br>
 <br>
Just like letters on the sand<br>
where waves were<br>
I feel you’ll disappear<br>
To a far off place<br>
I always miss you miss you<br>
 <br>
All the words<br>
In my heart<br>
I can’t show them all to you<br>
But, it’s that I love you<br>
 <br>
How can I be so lucky<br>
to have met you, who is a blessing<br>
If we’re together now<br>
Ah how great it’d be<br>
 <br>
Just like letters on the sand<br>
where waves were<br>
I feel you’ll disappear<br>
to a far off place<br>
I miss you again and miss you more<br>
 <br>
In my diary<br>
All the words<br>
I can’t show them all to you<br>
It’s that I love you<br>
<br>
Tonight, I’ll send the glow of a firefly<br>
to somewhere<br>
Near your window<br>
I hope it’s a good dream<br>
</p>
    </div>
  </div>
  <hr>
  

<!-- End page content -->
</div>

<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}
</script>
<c:import url="../bottom.jsp" charEncoding="utf-8" />



