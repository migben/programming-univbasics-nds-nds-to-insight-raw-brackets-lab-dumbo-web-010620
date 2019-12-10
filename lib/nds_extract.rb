$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

# I've copied the NDS used on this problem at a repl.it session. https://repl.it/@Mius00/Ruby-Playground-1 This made it easier for me to go over how to approach this exercise.

def directors_totals(nds)
  
 
  # We need to traverse the given NDS and allocate the director names as keys and the total revenue of their movies as values of a new hash. 
  
  #   Closely following this example in mind:
  #
  #   hash = {
  #   "1st Director's Name" => 1234567890,
  #   "2nd Director's Name" => 1234577890,
  #   "3rd Director's Name" => 1234709136,
  #   ...
  #   }
  
  # pp nds - needed to verify that we are working with the same NDS
  
  # at first glance it looks intimidating and complicated, as the way all our data is being nested. However, its only 3 layers/levels of data.
  
  names_revenue = { }
  
  idx = 0 
  
  while idx < nds.size # loop over each director hash.
    inner_idx = 0
    
    dir_mov = nds[idx][:movies] # as the idx increases we will have access to the list of movies of each director.
    
    
    names_revenue[nds[idx][:name]] = 0 # assigning our current director-key with a default value of 0. This will allow us to add the total revenue from all their directed movies
    
    while inner_idx < dir_mov.size # will loop over the list of movies of each director 
    
        names_revenue[nds[idx][:name]] += dir_mov[inner_idx][:worldwide_gross] # adding the total revenue of their movies to the current key / director 


        inner_idx += 1 # increasing the inner index to loop over the list of movies
    end
    
    idx += 1
  end
  
  
  
  names_revenue # returns the final hash with the directors and their total movie revenue
end

# directors_totals(directors_database) verified on irb that we are working with the same NDS that we had on the prior lesson.
