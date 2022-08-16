// ocamlc -o dsernag -pp "refmt -p ml" -impl dsernag.re
// Boolean value to check if is a vowel
let checkVowel = (letter : char) => {
  (letter == 'a' || letter == 'e' || letter == 'i' || letter == 'o' ||
    letter == 'u' || letter == 'y')
}
// Read each letter and return the vowels
let rec readChar = (line : string, size : int, count : int, vowels : int) => {
  if (count >= size) {
    vowels;
  } else {
    if (checkVowel(line.[count])) {
      readChar(line, size, count + 1, vowels + 1);
    } else {
      readChar(line, size, count + 1, vowels);
    }
  }
}
//Read each line:
let rec readLines = (amount : int) => {
  if (amount <= 0) {
    ();
  } else {
    let line : string = input_line(stdin);
    let size : int = String.length(line);
    let vowels = readChar(line, size, 0, 0);
    print_int(vowels);
    print_string(" ");
    readLines(amount - 1);
  }
}
// Main runing
readLines(int_of_string(input_line(stdin)));
print_newline();
/*
  cat DATA.lst | ./dsernag
  16 8 10 7 18 8 10 10 14 13 9 12 9 9 17 11 8 8 11
*/
