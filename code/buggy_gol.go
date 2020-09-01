package main

import (
    "fmt"
)



/* computing next generation
   input: current (previous) state
*/
func compute_next_generation(arr [10][10]int) {

   var i, j, k, l int 		/*iterator variables*/
   var aliveN int; 		/*contains alive neighbour count*/
   var twoD [10][10]int 	/* new generation placeholder matrix*/
    
   /*iterate through each cell in the grid*/
   for i=1;i<9;i++ {
       for j=1;j<9;j++ {

        /*iterate and sum 8 neighbours for given cell*/
 	aliveN = 0;
	for k=0; k<=1; k++ {
		for l=-1;l<=1;l++ {
		aliveN += arr[i+k][j+l];
		}
	}

        /*subtract the cell value to compute only neighbours*/
	aliveN += arr[i][j];

	/*check for the right condition and do the needful rules by GOL*/
	if ((arr[i][j] == 1) && (aliveN<2)) {
		twoD[i][j] = 0;
	} else if ((arr[i][j] == 1) && (aliveN>3)) {
		twoD[i][j] = 0;
	} else if ((arr[i][j] == 0) && (aliveN==3)) {
		twoD[i][j] = 1;
	} else {
		twoD[i][j] = arr[i][j];
	}
	}
   }

	/*Print New Generation*/
	fmt.Println("Printing new generation: ")
	for y := 0; y < 10; y++ {
		for x := 0; x < 10; x++ {

		if (twoD[y][x] == 1) {
			fmt.Printf("*")
		 } else {
			fmt.Printf("-")
		 }
		}
		fmt.Println("")
	     }
	}

func main() {
	/* 10-by-10 matrix representing the initial condition*/
   var a = [10][10]int{
   	    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } ,
            { 0, 0, 0, 1, 1, 0, 0, 0, 0, 0 } ,
            { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 } ,
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } ,
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } ,
            { 0, 0, 0, 1, 1, 0, 0, 0, 0, 0 } ,
            { 0, 0, 1, 1, 0, 0, 0, 0, 0, 0 } ,
            { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 } ,
            { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 } ,
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } ,
        }


         /* Print the initial condition*/
	fmt.Println("Printing Initial Condition: ")
	for y := 0; y < 10; y++ {
		for x := 0; x < 9; x++ {

		if (a[y][x] == 1) {
			fmt.Printf("*")
		} else {
			fmt.Printf("-")
		}
		}
		fmt.Println("")
	}


	/*Compute the next generation based on current state*/
	compute_next_generation(a)
	
}

