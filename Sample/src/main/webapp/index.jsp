<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tic Tac Toe</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <form class="container" method="post" action=TicTacToeServlet>
        <h1>Tic Tac Toe</h1>
        <h2 id="indicator"><%= request.getAttribute("indicator") != null ? request.getAttribute("indicator") : "Now Red Turn" %></h2>
        <div class="board">
            <!-- Replacing div with input for each cell -->
            
        	<input type="submit" class="cell" name="1:1"  value="<%= request.getAttribute("1:1") != null ? request.getAttribute("1:1") : "" %>" />
        	<input type="submit" class="cell" name="1:2"  value="<%= request.getAttribute("1:2") != null ? request.getAttribute("1:2") : "" %>" />
        	<input type="submit" class="cell" name="1:3"   value="<%= request.getAttribute("1:3") != null ? request.getAttribute("1:3") : "" %>" />
        	<input type="submit" class="cell" name="2:1"   value="<%= request.getAttribute("2:1") != null ? request.getAttribute("2:1") : "" %>" />
        	<input type="submit" class="cell" name="2:2"   value="<%= request.getAttribute("2:2") != null ? request.getAttribute("2:2") : "" %>" />
        	<input type="submit" class="cell" name="2:3"   value="<%= request.getAttribute("2:3") != null ? request.getAttribute("2:3") : "" %>" />
        	<input type="submit" class="cell" name="3:1"   value="<%= request.getAttribute("3:1") != null ? request.getAttribute("3:1") : "" %>" />
        	<input type="submit" class="cell" name="3:2"   value="<%= request.getAttribute("3:2") != null ? request.getAttribute("3:2") : "" %>" />
        	<input type="submit" class="cell" name="3:3"   value="<%= request.getAttribute("3:3") != null ? request.getAttribute("3:3") : "" %>" />
            
        </div>
        <button id="resetButton" name="reset" class="reset-button">Reset Game</button>
    </form>
</body>
</html>
<style>


.reset-button {
    margin-top: 20px; /* Space above the button */
    padding: 10px 20px; /* Padding inside the button */
    font-size: 1.2em; /* Font size of the text */
    background-color: #f44336; /* Red background */
    color: white; /* White text color */
    border: none; /* No border */
    border-radius: 5px; /* Rounded corners */
    cursor: pointer; /* Pointer cursor on hover */
    transition: background-color 0.3s; /* Smooth background color change */
}

.reset-button:hover {
    background-color: #d32f2f; /* Darker red on hover */
}

#indicator {
    font-size: 1.5em; /* Increase font size */
    color: green; /* Default color for player X */
    margin-bottom: 15px; /* Spacing below the turn indicator */
}

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    background-image: url(data:image/jpeg;base64,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); /* Link to your background image */
    background-size: cover; /* This makes sure the image covers the entire background */
    background-repeat: no-repeat;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    text-align: center;
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    margin-bottom: 20px;
}

.board {
    display: grid;
    grid-template-columns: repeat(3, 100px);
    grid-template-rows: repeat(3, 100px);
    gap: 5px;
}

/* Existing CSS for cell */
.cell {
    width: 100px;
    height: 100px;
    background-color: transparent; /* Removes background color */
    border: 2px solid #ccc; /* Keeps a faint square border */
    font-size: 4em; /* Makes the X larger */
    color: red; /* Color for X */
    text-align: center;
    font-weight: bold;
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
    box-sizing: border-box; /* Ensures border is within the cell size */
    transition: transform 0.2s ease, border-color 0.2s ease; /* Smooth transitions */
}

/* Hover effect */
.cell:hover {
    transform: scale(1.1); /* Slightly enlarge the cell */
    border-color: #ff9800; /* Change border color on hover */
}

/* Click effect */
.cell:active {
    transform: scale(0.9); /* Scale down when clicked */
}

/* Blue circle for O */
.cell[value="O"] {
    color: blue;
    font-size: 0; /* Hide text */
    background-color: blue; /* Use background color to represent O */
    border-radius: 50%; /* Make it a circle */
    position: relative;
}

/* Adjustments for center alignment for the O circle */
.cell[value="O"]::before {
    content: '';
    display: inline-block;
    width: 60px;
    height: 60px;
    background-color: blue;
    border-radius: 50%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

</style>