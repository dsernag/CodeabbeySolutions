/*
  groovyc dsernag.groovy
*/

// Define a function to check one match winner
def matchResult(String element) {
  if (element == "SP" || element == "RS" || element == "PR") {
    return "PLAYER1"
  }
  else if (element == "PS" || element == "SR" || element == "RP") {
    return "PLAYER2"
  }
  else {
    return
  }
}

// Define a function to obtain each element from list line and make the comparision
def readArray(List<String> array, int size, int count = 0,
  int points1 = 0, int points2 = 0) {

  String element = array[count]

  if (element == null) {
    return [points1, points2]
  }
  else {
    ans = matchResult(element)

    if (ans == "PLAYER1") {
      readArray(array, array.size(), count + 1, points1 + 1, points2)
    }
    else if (ans == "PLAYER2") {
      readArray(array, array.size(), count + 1, points1, points2 + 1)
    }
    else {
      readArray(array, array.size(), count + 1, points1, points2)
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

    (points1, points2) = readArray(listLine, listLine.size())
    findWinner(points1, points2)
  }
  return readLines(input)
}

// Find the winner
def findWinner(int points1, int points2) {
  if (points1 > points2) {
    System.out.print("1 ")
  }
  else {
    System.out.print("2 ")
  }
}

// Define a main function to operate
def main = {
  // Scan and ommit first line
  Scanner input = new Scanner(System.in)
  input.nextLine()

  readLines(input)
  System.out.println("")
}

// Run the main
main()

/*
  cat DATA.lst | groovy dsernag.groovy
  1 1 1 1 2 2 2 1 1 2 2 2 2 1 2 1 1 2 2 1 1 1 2 1
*/
