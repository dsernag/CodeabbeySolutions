// ocamlc -o dsernag -pp "refmt -p ml" -impl dsernag.re
///////////////////////////////////////////////////////////////////////////////
let rec sumDigits = (entry : string, counter : int, sum : int) => {
  if (counter >= String.length(entry)) {
    print_int(sum);
  } else {
    let sum = sum + int_of_string(Char.escaped(entry.[counter]))
    sumDigits(entry, counter + 1, sum)
  }
}
///////////////////////////////////////////////////////////////////////////////
// Main function to read lines and operate
let rec readLines = (lines : int) => {
  if (lines <= 0) {
    ();
  } else {
    let line = Array.of_list(String.split_on_char(' ', input_line(stdin)));
    let intLine = Array.map(number => int_of_string(number), line);
    let a_val = intLine[0];
    let b_val = intLine[1];
    let c_val = intLine[2];
    let number = a_val * b_val + c_val;
    sumDigits(string_of_int(number), 0, 0);
    print_string(" ");
    readLines(lines - 1);
  }
}
///////////////////////////////////////////////////////////////////////////////
readLines(int_of_string(input_line(stdin)));
print_newline();
///////////////////////////////////////////////////////////////////////////////
/*
  cat DATA.lst | ./dsernag
  25 16 19 25 19 28 27 18 17 16 28 24 35 17 25 
*/
