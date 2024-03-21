package model;

import java.awt.Point;
import java.util.List;

import model.univers.Directions;

public class Snake {
	

	private Point head;
	
	private List<Point> body;

	private int pitSize;
	
	private Directions direction;
	
	
	public Snake() {
		
	}
	
	public Snake(Point head, List<Point> body, int pitSize) {
		super();
		this.head = head;
		this.body = body;
		this.pitSize = pitSize;
		this.direction = null;
	}
	
	public void eat() {

		
		Point oldTail = body.get(body.size());
		Point antepenultimatePart = body.get(body.size());
		
		
		if(oldTail.x == antepenultimatePart.x) {
			oldTail.x++;
		}else {
			oldTail.y++;
		}
		
		Point newTail = oldTail.getLocation();
		body.add(newTail);
	}
	
	
	private void moveHead(Point newPosition) {
		this.head.x = newPosition.x;
		this.head.y = newPosition.y;
	}
	
	
	public void move() {
		Point newPosition;
		switch(direction) {
		case NORTH:
			newPosition = new Point(head.x + 1, head.y);
			break;
		case WEST:
			newPosition = new Point(head.x, head.y - 1);
			break;
		case EST:
			newPosition = new Point(head.x, head.y + 1);
			break;
		case SOUTH:
			newPosition = new Point(head.x - 1, head.y);
			break;
		default:
			newPosition = head;
		}
		
		//add case snake out of bound 
		
		this.bodyFollowHead(new Point(this.head.getLocation().x, this.head.getLocation().y));
		moveHead(newPosition);
	}
	
	private void bodyFollowHead(Point oldHead) {
		
		// à tester 
		for(int i = 0; i < body.size(); i++) {
			if(i == 0) {
				this.body.get(i).setLocation(oldHead);		
			}
			this.body.get(i+1).setLocation(this.body.get(i));			
		}
	}
	
	public int getPitSize() {
		return pitSize;
	}
	
	public void setPitSize(int pitSize) {
		this.pitSize = pitSize;
	}
	
	public Point getHead() {
		return head;
	}
	
	public void setHead(Point head) {
		this.head = head;
	}
	
	public List<Point> getBody() {
		return body;
	}
	public Directions getDirection() {
		return direction;
	}
	
	public void setDirection(Directions direction) {
		this.direction = direction;
	}
}


