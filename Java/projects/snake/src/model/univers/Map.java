package model.univers;

import java.awt.Point;

import model.Snake;
import model.SnakeTypes;

public class Map {
	
	Cell[][] pit;
	
	Snake snakeRed;
	
	Snake snakeBlue;
	
	Cell[] food;
	
	private static int [] initialSnake = {4, 5, 6, 7, 8};

	
	public Map() {
		pit = new Cell[50][50];
	}
	
	private void initSnakes() {
		
		//Cell[] body = new Cell[][];
		
		this.snakeBlue = new Snake(); 
	}
	
	
	private Cell[] getSnake(Point head, Point body) {
		
		return null;
	}
	
	private Cell[] getBody(SnakeTypes type) {

		Cell[] body = new Cell[5];
		
		for(int i = 0; i < body.length; i++) {
			body[i].getPosition().x = initialSnake[i];
			body[i].getPosition().y = type == SnakeTypes.redSnake ? pit[0].length + 6 : pit[0].length - 6; 
		}
		return body;
	}
	
	//

}
