<html>
  <head>
    <link rel="stylesheet" href="style.css" />
    <title>Login</title>
  </head>
  <body>
  <main>
	<%@ include file="outside-nav.jsp" %>
    <div class="modal-container vh-90">
      <form class="spaced" action="login" method="POST">
        <h2>Login!</h2>
        <label>
          Username <br />
          <input type="text" name="username" />
        </label>

        <label>
          Password <br />
          <input type="password" name="password" />
        </label>

        <div>
          <button>Continue</button>
        </div>
      </form>
    </div>
  </main>
  </body>
</html>
