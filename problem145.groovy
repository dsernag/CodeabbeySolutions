/*
  groovyc dsernag.groovy
*/

// Define a function to return the operation
def modularExpo(List<String> array_entry) {
  element1 = array_entry[0].toBigInteger()
  element2 = array_entry[1].toBigInteger()
  element3 = array_entry[2].toBigInteger()

  System.out.print((element1.modPow(element2, element3)) + " ")
}

// Define a function to read each line:
def readLines(Scanner input){
  if (!input.hasNextLine()){
    return
  }
  else {
    String newLine = input.nextLine()
    List<String> listLine = newLine.split(" ")

    modularExpo(listLine)

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
  136367979 103171039 211726231 144849531 238404643 67726704 108081372
  118415791 9886996 142331618 121855120 36435859 52644667 68896566 66501369
  139239273 162763634 87936671 122631119 2811626 52976820 
*/
