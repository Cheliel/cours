package com.cci.gameoflife;

public class Launcher {
	public static void main(String[] args) {

		World world = new World(10, 10); // Crée un monde de 10x10 avec des cellules aléatoires
		System.out.println("Generation 0:");
		System.out.println(world);

		for (int i = 1; i <= 10; i++) {
			world.newGeneration();
			System.out.println("Generation " + i + ":");
			System.out.println(world);
		}
	}
}
