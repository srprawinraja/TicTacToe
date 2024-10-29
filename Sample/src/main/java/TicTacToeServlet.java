

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TicTacToeServlet
 */
@WebServlet("/TicTacToeServlet")
public class TicTacToeServlet extends HttpServlet {
    private HashMap<String, String> board;
    private String currentPlayer; // Current player ('X' or 'O')
    private String indicator;
    private boolean reset=false;
    
    public TicTacToeServlet() {
        board = new HashMap<>();
        currentPlayer = "O"; // Player X starts
        indicator="";
        initializeBoard(); // Fill the board with empty spaces
    }
    private void initializeBoard() {
        board.put("1:1", "");
        board.put("1:2", "");
        board.put("1:3", "");
        board.put("2:1", "");
        board.put("2:2", "");
        board.put("2:3", "");
        board.put("3:1", "");
        board.put("3:2", "");
        board.put("3:3", "");
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public boolean checkWinner(String player) {
        // Check rows
        for (int row = 1; row <= 3; row++) {
            if (board.get(row + ":1").equals(player) && 
                board.get(row + ":2").equals(player) && 
                board.get(row + ":3").equals(player)) {
                return true;
            }
        }

        // Check columns
        for (int col = 1; col <= 3; col++) {
            if (board.get("1:" + col).equals(player) && 
                board.get("2:" + col).equals(player) && 
                board.get("3:" + col).equals(player)) {
                return true;
            }
        }

        // Check diagonals
        if (board.get("1:1").equals(player) && 
            board.get("2:2").equals(player) && 
            board.get("3:3").equals(player)) {
            return true;
        }

        if (board.get("1:3").equals(player) && 
            board.get("2:2").equals(player) && 
            board.get("3:1").equals(player)) {
            return true;
        }

        // If no winning condition is met
        return false;
    }
    
	private void setTheMove(String key) {
		if(board.get(key)=="") {
			changePlayer();
			board.put(key, currentPlayer);
		} 
	}
	
	private void findTheSelectedMove(HttpServletRequest request,  HttpServletResponse response) {
		for (String key : board.keySet()) {
            if(request.getParameter(key)!=null) {
            	setTheMove(key);
            	break;
            }
        }
		setTheChanges(request, response);
	}
	
	private void changePlayer() {
		if(currentPlayer=="X") {
			currentPlayer="O";
			indicator="Now Red Turn";
		
		} else {
			currentPlayer="X";
			indicator="Now Blue Turn";
		}
	}
	
	
	
	private void setTheChanges(HttpServletRequest request, HttpServletResponse response) {
		for (String key : board.keySet()) {
			request.setAttribute(key, board.get(key));
		}
		
		if(!reset) {
			if(checkWinner("X")) {
				indicator="X has Won";
				reset=true;
			} else if(checkWinner("O")) {
				indicator="O has Won";
				reset=true;
			} else if(isBoardFull()) {
				indicator="X & O has Drawn";
				reset=true;
			}
		}
		
		request.setAttribute("indicator", indicator);
		
		try {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
    public boolean isBoardFull() {
    	int count=0;
        for (String key : board.keySet()) {
            if (board.get(key)!="") {
                count++;
            }
        }
        return count==9; // No empty cells found, the board is full
    }
	
    public void resetAll(HttpServletRequest request, HttpServletResponse response) {
    	initializeBoard();
    	currentPlayer="O";
    	indicator="Now Red Turn";
    	reset=false;
    	try {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
    }
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("reset")!=null) {
			resetAll(request, response);
			
		} else {
			if(!reset) {
				findTheSelectedMove(request, response);
			} else {
				setTheChanges(request, response);
			}
		}
	}

}
