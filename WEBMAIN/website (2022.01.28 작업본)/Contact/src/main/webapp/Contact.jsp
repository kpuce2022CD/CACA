<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>Contact</title>
    <link rel="stylesheet" href="./css/test.css" media="screen">
  </head>

  <body>
    <header>
  			<nav>
			<a href="#" class="logo">Clonet</a>
				<ul class = "navlinks">
					<li><a href="http://localhost:8080/Illustration/IllustrationServlet">Illustration</a></li>
					<li><a href="http://localhost:8080/About/AboutServlet">About</a></li>
					<li><a href="http://localhost:8080/Contact/ContactServlet">Contact</a></li>
					<li><a href="http://localhost:8080/Login/LoginServlet">Logout</a></li>
				</ul>
			</nav>
    </header>
    
    <section>
      <div>
        <div>
          <div>
            <h1>Contact</h1>
          </div>
        </div>
        
        <img src="images/b15142ad42bf60f5c46df0d11bce7b70a01248ab25fade6148f94fee3bee0deb04ae482eb97355d235a90acd80d992a48454b2a47467291c2a1bdd_1280.jpg">
        <div>
          <div>
            <p>CONTACT<br>WITH US&nbsp;</p>
          </div>
        </div>
        <p>Headline</p>
        <p>the title</p>
        <div>
          <div>
            <div>
              <form action="#" method="POST" source="custom" name="form">
              
                <div>
                  <label>Name</label>
                  <input type="text" placeholder="Enter your Name" id="name-5a14" name="name" required="">
                </div>
                
                <div>
                  <label for="email-5a14" wfd-invisible="true">Email</label>
                  <input type="email" placeholder="Enter a valid email address" id="email-5a14" name="email" required="">
                </div>
                
                <div>
                  <label for="message-5a14" wfd-invisible="true">Message</label>
                  <textarea placeholder="Enter your message" rows="4" cols="50" id="message-5a14" name="message"required=""></textarea>
                </div>
                
                <div>
                  <a href="#">Submit</a>
                  <input type="submit" value="submit" wfd-invisible="true">
                </div>
                
                <div wfd-invisible="true"> Thank you! Your message has been sent. </div>
                <div wfd-invisible="true"> Unable to send your message. Please fix errors then try again. </div>
                <input type="hidden" value="" name="recaptchaResponse" wfd-invisible="true">
              </form>
              
            </div>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>