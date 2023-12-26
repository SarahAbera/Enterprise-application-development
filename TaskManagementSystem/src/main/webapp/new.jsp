<html>
  <head>
    <link rel="stylesheet" href="style.css" />
    <title>Create Task</title>
  </head>
  <body>
    <main>
	<%@ include file="inside-nav.jsp" %>
      <h1>Create Task</h1>
      <div class="modal-container">
        <form class="spaced" action="new" method="POST">
          <label>
            Title <br />
            <input type="text" name="title"  />
          </label>

          <label>
            Description <br />
            <textarea name="description" rows="5" cols="45" ></textarea
            >
          </label>

          <label>
            Due Date <br />
            <input type="date" name="due_date"/>
          </label>

          <label
            >Priority Level
            <br />
            <input type="number" name="priority_level" />
          </label>
          <div>
            <button>Add</button>
          </div>
        </form>
      </div>
    </main>
  </body>
</html>
