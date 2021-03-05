#!/usr/bin/awk -f

BEGIN{
  TREE    = "T"
  BURNING = "w"    # w looks like fire, right?
  # Get height, width and probabilities from command line
  X = ARGV[1]
  Y = ARGV[2]
  F = ARGV[3]
  P = ARGV[4]
  printf("\033[?25l") # Remove Cursor
  while(1){
    # Generate new state depending on old state and random
    for(x=1; x<=X; x++)
      for (y=0; y<Y; y++){
        # Default: state does not change
        new[x,y]=old[x,y]
        # Random grow of TREE on EMPTY field
        if (!old[x,y] && rand()<P){
          new[x,y]=TREE
          printf("\033[32m\033["x";"y"HT")
        }
        # BURNING tree turns to EMPTY field
        if (old[x,y]==BURNING){
          new[x,y]=0
          printf("\033[33m\033["x";"y"H ")
        }
        # TREE starts BURNING randomly or if a neighbour is BURNING
        if (old[x,y]==TREE)
          if (rand()<F || match(old[x-1,y] old[x,y-1] old[x+1,y] old[x,y+1], BURNING)){
             new[x,y]=BURNING
             printf("\033[31m\033["x";"y"Hw")
          }
      }
    # Copy new state -> old state 
    for(x=1; x<=X; x++)
      for (y=0; y<Y; y++)
        old[x,y]=new[x,y]
  }
}
