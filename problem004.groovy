/*
  groovyc dsernag.groovy
*/

// Define the readStdin and min function:
def RecursiveMinTwo(Scanner input) {
  try {
    // Read each line and split it
    String newLine = input.nextLine()
    List<String> splitLine = newLine.split(" ")

    // Condition for the recursionn
    if (splitLine.size() != 1) {
      int first = splitLine[0].toInteger()
      int second = splitLine[1].toInteger()
      int solution = Math.min(first, second)
      System.out.println(solution)
    }
    RecursiveMinTwo(input)
  }
  catch(java.util.NoSuchElementException ex) {
  }
}

// Main function to get the input from the console
def main = {
  Scanner input = new Scanner(System.in)
  RecursiveMinTwo(input)
}

// Run the main function
main()

/*
  cat DATA.lst | groovy dsernag.groovy
  3755295 -5609689 625941 -9878960 -2712077 4212348 -6242772 -9939337 -5054586
  -8684361 1564403 683565 -7012342 -1985085 -6691661 4108374 -9339035 -1954951
  -2002145 1325147 -5894564 -3645411 -5930290 -4267076 -7204816 -3867858
*/
