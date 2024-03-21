package com.cci.gameoflife;

import java.util.Random;

public class World {

	private Cell[][] world;

	public World(int nbColumns, int nbRows) {
		world = new Cell[nbRows][nbColumns];
		initializeRandomWorld();
	}

	public World(Cell[][] world) {
		this.world = world;
	}

	public void newGeneration() {
		Cell[][] newWorld = new Cell[world.length][world[0].length];

		for (int i = 0; i < world.length; i++) {
			for (int j = 0; j < world[i].length; j++) {
				int nbNeighbours = countNeighbours(i, j);
				newWorld[i][j] = world[i][j].newGeneration(nbNeighbours);
			}
		}

		world = newWorld;
	}

	private void initializeRandomWorld() {
		Random random = new Random();
		for (int i = 0; i < world.length; i++) {
			for (int j = 0; j < world[i].length; j++) {
				world[i][j] = random.nextBoolean() ? new AliveCell() : new DeadCell();
			}
		}
	}

	private int countNeighbours(int row, int column) {
		int count = 0;
		for (int i = row - 1; i <= row + 1; i++) {
			for (int j = column - 1; j <= column + 1; j++) {
				if (i >= 0 && i < world.length && j >= 0 && j < world[0].length && !(i == row && j == column) && world[i][j].isAlive()) {
					count++;
				}
			}
		}
		return count;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < world.length; i++) {
			for (int j = 0; j < world[i].length; j++) {
				sb.append(world[i][j].getAsString()).append(" ");
			}
			sb.append("\n");
		}
		return sb.toString();
	}
}
