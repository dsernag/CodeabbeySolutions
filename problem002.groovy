/*
  groovyc dsernag.groovy
*/

// Define a function to obtain each element and make the comparision
def sumArray(List<String> array, int size, int count = 0, int sum = 0) {
  if (count >= size) {
    return sum
  }
  else {
    int element = array[count].toInteger()
    sumArray(array, array.size(), count + 1, sum + element)
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

    array_sum = sumArray(listLine, listLine.size())
    System.out.println(array_sum)

  }
  return readLines(input)
}

// Define the main function to run:
def main = {
  // Read the line and ommit the first line:
  Scanner input = new Scanner(System.in)
  input.nextLine()

  readLines(input)
}

// Run the main function:
main()

/*
  cat DATA.lst | groovy dsernag.groovy
  27455
*/
