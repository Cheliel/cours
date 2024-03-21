package com.cci.gameoflife;

public class AliveCell implements Cell {
	
	private int age = 0;
	@Override
	public Cell newGeneration(int nbNeighbours) {
		if (nbNeighbours < 2 || nbNeighbours > 3) {
			return new DeadCell();
		}
		age++;
		return this;
	}

	@Override
	public String getAsString() {
		return (age == 0) ? "0" : "+";
	}

	@Override
	public boolean isAlive() {
		return true;
	}
}
