package com.cci.gameoflife;

public interface Cell {
	abstract public Cell newGeneration(int nbNeighbours);
	abstract public String getAsString();
	abstract public boolean isAlive();
}