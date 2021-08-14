<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- aos css file cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">

    <!-- magnific popup css cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">

    <!-- bootstrap cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap.min.css">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <!-- custom css file link  -->
     <style type="text/css">
     @CHARSET "ISO-8859-1";



html{
  
  
}

body{
background-color:black;
  overflow-x: hidden;
}

section{
  overflow: hidden;
}

.button{
  height:3.5rem;
  width: 15rem;
  background:var(--blue);
  color:#fff;
  font-size: 1.7rem;
  text-transform: capitalize;
  border-radius: .5rem;
  cursor: pointer;
  position: relative;
  z-index: 0;
  overflow: hidden;
  margin:1rem 0;
}

.button::before{
  content: '';
  position: absolute;
  top: -100%; left: 0;
  height:100%;
  width: 100%;
  background-color: var(--black);
  z-index: -1;
  transition: .2s linear;
}

.button:hover:before{
  top: 0%;
}

.button:hover{
  box-shadow: .1rem .5rem var(--blue),
              0 .3rem .5rem rgba(0,0,0,.3);
}

.heading{
  text-align: center;
  font-size: 4rem;
  padding:1rem;
  padding-top: 8rem;
  color:var(--black);
}

.heading span{
  color:var(--blue);
}

header{
  width:100%;
  position: fixed;
  top:0; left: 0;
  padding:2rem 1rem;
  z-index: 1000;
}

.header-active{
  background:#fff;
  box-shadow: 0 .1rem .3rem rgba(0,0,0,.3);
  padding: .5rem 1rem;
}

header .container{
  display: flex;
  align-items: center;
  justify-content: space-between;
}

header a{
  color:var(--black);
}

header a:hover{
  color:var(--blue);
}

header .container .logo{
  font-size: 3rem;
}

header .container .logo span{
  color:var(--blue);
}

header .nav ul{
  margin:0; padding: 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  list-style: none;
}

header .nav ul li{
  margin: 0 1rem;
}

header .nav ul li a{
  font-size: 2rem;
}

header .fa-bars{
  font-size: 3.5rem;
  color:var(--blue);
  cursor: pointer;
  display: none;
}

.home .content h1{
  font-size: 5rem;
  color:var(--black);
}

.home .content h1 span{
  color:var(--blue);
}

.home .content h3{
  font-size: 4rem;
  color:var(--black);
}

.about{
  background:#eee;
  color:var(--black);
}

.about .content .box{
  margin:3rem 0;
}

.about .content .box h3{
  font-size: 2.5rem;
  color:var(--black);
}

.about .content .box h3 i{
  padding: 0 1rem;
  color:var(--blue);
}

.about .content .box p{
  font-size: 1.7rem;
  padding-left: 6rem;
  color:#666;
}

.facility{
  min-height: 100vh;
}

.facility .box-container{
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  padding-bottom: 3rem;
}

.facility .box-container .box{
  height:20rem;
  width:30rem;
  margin:.3rem;
  overflow: hidden;
}

.facility .box-container .box img{
  height:100%;
  width:100%;
  object-fit: cover;
}

.facility .box-container .box:hover img{
  transform: scale(1.3);
}

.review{
  background-image:url("ichi.jpg");
  background-size: cover;
  background-position: center;
  background-blend-mode: multiply;
}

.review .heading{
  color:black;
}

.review .box-container{
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  padding-bottom: 5rem;
}

.review .box-container .box{
  background:#fff;
  width:30rem;
  margin:5rem 1rem;
  padding:1.5rem;
  position: relative;
}

.review .box-container .box img{
  position: absolute;
  bottom: -7.5rem; left: -1rem;
  height:5rem;
  width:5rem;
  border-radius: 50%;
  object-fit: cover;
}

.review .box-container .box p{
  font-size: 1.4rem;
  color:var(--black);
}

.review .box-container .box h3{
  text-align: end;
  color:var(--blue);
}

.review .box-container .box span{
  text-align: end;
  color:var(--black);
  display: block;
  font-size: 1.5rem;
}

.review .box-container .box::before{
  content: '';
  position: absolute;
  bottom: -1rem; left:.4rem;
  height:2rem;
  width:2rem;
  background:#fff;
  transform: rotate(45deg);
}




}
     </style>
</head>

<body>

<section class="review" id="review">

<div class="container">

<h1 class="heading"><span></span> 'Customer's review' <span></span></h1>

<div class="box-container">

    <div class="box" data-aos="fade-right">
        <p>Fit for all Girls Just go girl choose the beautiful dress.   i can happily say Am the Happy Customer </p>
        <h3>Alka Yadav</h3>
        <span>jan 30 2021</span>
        <img src="Photo/customer2.jpg" alt="">
    </div>

    <div class="box" data-aos="fade-up">
        <p>Am Glad to share that the Ethnics which i feel by wearing Vastra Collection It makes me so Comfortable</p>
        <h3>Rashmi Rao</h3>
        <span>jan 16 2021</span>
        <img src="Photo/customer3.png" alt="">
    </div>
 <div class="box" data-aos="fade-right">
        <p>I Love the Collection of Vastra from their Collections i choose my Wedding Dress and it makes my Day so special.</p>
        <h3>Mohina Sapra</h3>
        <span>feb 7, 2021</span>
        <img src="Photo/customer4.jpg" alt="">
    </div>
    <div class="box" data-aos="fade-left">
    <p>One of the most popular Collections for Indian girls who love to wear beautiful collection of Vastra.
    
    </p>
        <h3>Bhawna Singh</h3>
        <span>march 10, 2021</span>
        <img src="Photo/customer7.jpg" alt="">
    </div>

</div>

</div>

</section>

<!-- review section ends  -->
<!-- jquery cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- magnific popup js link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>

<!-- aos js file cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

<!-- custom js link  -->


<script>

AOS.init({
    duration:1000,
    delay:400
});
$(document).ready(function(){

	  $('.fa-bars').click(function(){
	    $(this).toggleClass('fa-times');
	    $('.nav').toggleClass('nav-toggle');
	  });

	  $(window).on('load scroll',function(){

	    $('.fa-bars').removeClass('fa-times');
	    $('.nav').removeClass('nav-toggle');

	    if($(window).scrollTop() > 10){
	      $('header').addClass('header-active');
	    }else{
	      $('header').removeClass('header-active');
	    }

	  });

	  $('.facility').magnificPopup({
	    delegate:'a',
	    type:'image',
	    gallery:{
	     enabled:true
	    }
	  });

	});

</script>


</body>
</html>