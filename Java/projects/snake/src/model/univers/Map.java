package model.univers;

import java.awt.Point;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import model.Snake;
import model.SnakeTypes;

public class Map {
	
	Cell[][] pit;
	
	Snake redSnake;
	
	Snake blueSnake;
	
	List<Cell> food;
	
	private static int [] initialSnake = {4, 5, 6, 7, 8};

	
	public Map() {
		pit = new Cell[50][50];
		initPit();
		initSnakes();
		addFood();
	}
	
	private void initSnakes() {

		Point head = new Point(9, pit[0].length - 6);
		this.redSnake = new Snake(head, getBody(SnakeTypes.redSnake), pit[0].length); 
		head.y = 6;
		this.blueSnake = new Snake(head, getBody(SnakeTypes.redSnake), pit[0].length); 
	}
	
	public void newGeneration() {
		this.blueSnake.move();
		this.redSnake.move();
		spoilFood();
		// add rules verification 
		// 1 - eating
		// 2 - head crossing
	}
	
	public void addFood() {
		if(food == null) {
			food = new ArrayList<Cell>();
			Random r = new Random();
			int x = r.nextInt() % pit.length + 1;
			int y = r.nextInt() % pit.length + 1;
			while(isCellOccuped(new Point(x, y))) {
				x = r.nextInt() % pit.length + 1;
				y = r.nextInt() % pit.length + 1;
			}
			food.add(pit[y][x]);
		}
	}
	
	public boolean isCellOccuped(Point point) {
		Cell c = pit[point.y][point.y];
		if(c.isFood() || c.isSnake() || c.isSnakeHead()) {
			return false;
		}
		return true;
	}
	
	private void setSnakePosition(Snake snake, int i, int y) {
		if(snake.getBody().equals(pit[i][y].getPosition())) {
			pit[i][y].setSnake(true);
		}else if(pit[i][y].isSnake()) {
			pit[i][y].setSnake(false);
		}
		
		if(snake.getHead().equals(pit[i][y].getPosition())) {
			pit[i][y].setSnakeHead(true);
		}else if(pit[i][y].isSnakeHead()) {
			pit[i][y].setSnakeHead(false);
		}
	}
	
	private void setFoodPositions(int i, int y) {
		for(Cell berry : food) {
			if(berry.getPosition().equals(new Point(i, y))) {
				pit[i][y].setFood(true);
			} else if(pit[i][y].isFood()) {
				pit[i][y].setFood(false);
			}
		}
	}
	
	private List<Point> getBody(SnakeTypes type) {

		//Cell[] body = new Cell[5];
		List<Point> body = new ArrayList<Point>();
		for(int i = 0; i < body.size(); i++) {
			body.get(i).getLocation().x = initialSnake[i];
			body.get(i).getLocation().y = type == SnakeTypes.redSnake ? pit[0].length - 6 : 6; 
		}
		return body;
	}
	
	private void initPit() {
		for(int i = 0; i < pit.length; i++) {
			for(int y = 0; y < pit[i].length; y++) {
				pit[i][y].setX(i);
				pit[i][y].setX(y);	
				setSnakePosition(this.blueSnake, i, y);
				setSnakePosition(this.redSnake, i, y);	
				setFoodPositions(i, y);
			}
		}	
	}
	
	public void spoilFood() {
		for(Cell berry : food) {
			if(berry.getfooLifeTime() - new java.util.Date().getTime() > 3000) {
				berry.setFood(false);
			}
		}
	}

	
}
