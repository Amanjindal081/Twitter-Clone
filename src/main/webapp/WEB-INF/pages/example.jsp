<html lang="en">
<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="styles/login.css">
  <title>Login</title>
  <style>
    body{
    /*   background:#262626; */
      background-image: linear-gradient(to right, #1DA1F2 , #1DA1F2);
      color:black;
      font-size:18px;
    }
    .form{
      font-size:20px;
      margin:auto;
      font-family:sans;
      width:100%;
      max-width:400px;
      border:2px solid white;
      border-radius:25px;
      padding:0px 10px 50px 10px;
      background:white;
      color:#00acee;
    }
    .labels{
      width:100%;
    }
    body {
     font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    }
    .inputs{
      text-indent:10px;
      font-size:20px;
      width:100%;
      padding:5px 0px 5px 0px;
      outline:none;
      border-radius:25px;
      margin:20px 0px 20px 0px;
      box-shadow:5px  5px 10px white;
    }
    #button{
      width:100%;
      background:white;
      padding:10px;
      border-radius:25px;
      border:2px solid white;
      font-size:20px;
      margin-top:50px;
      color:#00acee;
    }
    #button:hover{
      cursor:pointer;
    }
    .other{
      text-align:center;
      color:white;
      padding-top:20px;
    }
    .other a{
      text-decoration:none;
      color:#00acee;
      background:white;
      padding:10px;
      border:2px solid white;
      border-radius:10px;
    }
  </style>
</head>
<body><section>
  <form method="post" class="form" id="box">
    <h1 style="text-align:center;">Login</h1>
    <label for="username"  class="labels">Username:</label>
    <input id="signup-name" type="text" class="username inputs" name="user_name" placeholder="Enter your name..." required>
    <label for="usermail"  class="labels">Your mail:</label>
    <input id="signup-email" type="text" class="username inputs" name="user_name" placeholder="Enter your mail id..." required>


    <label for="password" class="labels">Password</label>
    <input id="signup-password" type="password" class="inputs" name="password" placeholder="Enter your password..." required>
    <p style = "color:red; display:none"></p>
    <button type="submit">SignUp</button>
    <input id="button" type="submit" value="Login">
    <hr>
    <div class="other">
    <a href="signup.php">Click to Sign Up</a>
    </div>
  </form>
  <script>
    function validateSignupForm(){
        var name =$("signup-name").val();
        var email = $("signup-email").val();
        var password =$("signup-password").val();
        var error=" ";
        if(!name){
            error+="Name is empty";
        }
        if(!email){
            error+="Email is empty";
        }
        if(!password){
        error+="Password is empty" ;
        }
        if(!password && password.length<=3){
        error+="password length must be greater than 3";
    }
</section>
</body>
</html>