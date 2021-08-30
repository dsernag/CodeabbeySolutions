/*
  groovyc dsernag.groovy
*/

// Define the function to solve the problem
def matchesPicking(List<String> array) {
    heap_matches = array[0].toInteger()
    player_matches = array[1].toInteger()
    game_type = array[2]

    residual = heap_matches % (player_matches + 1)

    if (game_type == "n") {
        System.out.print(residual + " ")
    }
    else if (game_type == "i") {
        new_residual = (heap_matches % (player_matches + 1)) - 1
        
        if (new_residual < 0) {
            System.out.print(player_matches + " ")
        }
        else {
            System.out.print(new_residual + " ")
        }
    }
}

// Define a function to read each line:
def readLines(Scanner input){
  if (!input.hasNextLine()){
    return
  }
  else {
    String newLine = input.nextLine()
    List<String> listLine = newLine.split(" ")

    matchesPicking(listLine)

  }
  return readLines(input)
}

// Define the main function to run:
def main = {
  // Read the line and ommit the first line:
  Scanner input = new Scanner(System.in)
  input.nextLine()

  readLines(input)
  System.out.println("")
}

// Run the main function:
main()

/*
  cat DATA.lst | groovy dsernag.groovy
  7 1 0 2 6 2 4 8 2 2 2 3 6 1 3 1 4 0 1 8 14 4 5 2 16 8 3 
*/
