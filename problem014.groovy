/*
groovyc dsernag.groovy
*/

import static java.lang.Math.BigInteger

//Define a Recursive Reader function from stdin
def recursiveReader(Scanner input) {
  try {
    String newLine = input.nextLine()
    List<String> splitLine = newLine.split(" ")
    
    if (splitLine.size() > 1) {
      String op = splitLine[0]
      BigInteger num = splitLine[1].toBigInteger()
      return [op, num]
    }
    recursiveReader(input)
  }
  catch(java.util.NoSuchElementException ex) {
  }
}
// Define calculator
def Calculator(BigInteger track_number, String op, BigInteger num) {
  if (operator == "+") {
    BigInteger new_number = track_number + num
    return new_number
  }
  else if (operator == "*") {
    BigInteger new_number = track_number * num
    return new_number
  }
}

// Define the end of the calculator (%)
def endCalculator (BigInteger track_number, BigInteger num) {
  return track_number % num
}

// Define a recursive function to do the operation
def RecursiveOperation(Scanner input, BigInteger entry_num) {
  try {
    (operator,number) = recursiveReader(input)
    
    if (operator == "%") {
      return endCalculator(ans,number)
    }
    else {
      ans = Calculator(entry_num, operator, number)
      RecursiveOperation(input, ans)
    }
  }
  catch(java.lang.NullPointerException ex) {
  }
}

// Main function to run
def main = {
  // Scan the first line and obtain the first_number
  Scanner input = new Scanner(System.in)
  BigInteger first_number = input.nextInt()
  
  //Use the Recursive operation
  BigInteger result = RecursiveOperation(input,first_number)
  System.out.println(result)
}

main()

/*
  cat DATA.lst | groovy dsernag.groovy
  1492
*/
