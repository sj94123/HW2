[![DOI](https://zenodo.org/badge/288799494.svg)](https://zenodo.org/badge/latestdoi/288799494) 
[![Build Status](https://travis-ci.com/sj94123/HW2.svg?branch=master)](https://travis-ci.com/sj94123/HW2)
[![Run on Repl.it](https://repl.it/badge/github/sj94123/HW2)](https://repl.it/github/sj94123/HW2)



Game Of Life

The Game of Life is a   cellular automaton   devised by the British mathematician   John Horton Conway   in 1970.   It is the best-known example of a cellular automaton.

Conway's game of life is described   here:

http://rosettacode.org/wiki/Conway%27s_Game_of_Life#SQL

Execution Plan - 

https://docs.google.com/document/d/1HjHplaU41RIkUdKCbL0hb_3rB3SjF8WRhN86uzsPNHc/edit

How to Run the Codes - 

A) For Ruby and Go code 

1. Click on the DOI of repl.it in the readme

2. Now click on the .replit file in the files explorer and paste -
  
  (i) for Go - 
      
     language = "ruby"
     run = "go run code/buggy_gol.go"
   
  (ii) for Ruby -
     
     language = "ruby"
      run = "ruby life.rb"
      
B) For SQL code

Use SQLFiddle: http://sqlfiddle.com/#!17
   
Copy the SQL code onto the Schema Panel, build schema.

You can check the output in a tabular format by querying

      SELECT * FROM output order by ID;
