<html>
  <head>
    <link rel="stylesheet" href="style.css" />
    <title>Sign Up</title>
  </head>
  <body>
    <main>

	<%@ include file="outside-nav.jsp" %>
      <div class="modal-container vh-90">
        <form class="spaced" action="signup" method="POST">
          <h2>Sign Up!</h2>
          <label>
            Username <br />
            <input type="text" name="username" />
          </label>

          <label>
            Password <br />
            <input type="password" name="password" />
          </label>

          <div>
            <button>Sign Up</button>
          </div>
        </form>
      </div>
    </main>
  </body>
</html>
