// ocamlc -o dsernag -pp "refmt -p ml" -impl dsernag.re
include Int64;
// Extended Euclidean Algorithm
let rec gcdExten = (a_val : int64, b_val : int64) => {
  if (b_val == zero) {
    [| a_val, of_int(1), of_int(0)|];
  } else {
    let vals = gcdExten(b_val, rem(a_val, b_val));
    let gcd = vals[0];
    let x_val = vals[2];
    let y_val = sub(vals[1], mul(div(a_val, b_val), vals[2]));
    [| gcd, x_val, y_val|]
  }
}
///////////////////////////////////////////////////////////////////////////////
// Main function to read lines and operate
let rec readLines = (lines:int) => {
  if (lines <= 0) {
    ();
  } else {
    let line = Array.of_list(String.split_on_char(' ', input_line(stdin)));
    let intLine = Array.map(number => of_string(number), line);
    let val1 = intLine[0];
    let val2 = intLine[1];
    let gcdAns = gcdExten(val1, val2);
    print_string(to_string(gcdAns[0]));
    print_string(" ");
    print_string(to_string(gcdAns[1]));
    print_string(" ");
    print_string(to_string(gcdAns[2]));
    print_string("\n");
    readLines(lines - 1);
  }
}
///////////////////////////////////////////////////////////////////////////////
readLines(int_of_string(input_line(stdin)));
///////////////////////////////////////////////////////////////////////////////
/**
  cat DATA.lst | ./dsernag
  5 -8269 6629
  1 14626 -9861
  1 37683 -16207
  1 -11105 15187
  2 -8250 4009
  25 -109 28
  5 2376 -3067
  1 14775 -14464
  2 -596 1393
  1 43262 -9299
  1 47641 -36708
  1 4529 -10036
  1 20068 -12605
  1 15912 -9073
  1 -6883 14147
  7 1357 -1360
  1 -16819 28036
  2 -903 2063
  1 -2587 1878
  1 21469 -8122
  2 -9015 23426
  1 -5287 3472
  1 6658 -16847
  1 8731 -8577
  1 -12556 23053
  1 -6472 4419
  2 1153 -3037
  1 38791 -24529
  1 -5838 13109
  1 35891 -8969
  1 2242 -7829
*/
