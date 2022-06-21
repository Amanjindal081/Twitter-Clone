<html>
<body>
    user is trying to login at this time
      <div id="time">
      </div>
      <br>
      <br>
      <div>
           <marquee> Made with love with aman </marquee>

      </div>

    <script type="text/javscript">
        function updateTime(){
               document.getElementById("time").innerText=new Date().toString();
        }
        setInterval( updateTime,  1000 );
    </script>
</body>
</html>