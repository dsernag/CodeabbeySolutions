// ocamlc -o dsernag -pp "refmt -p ml" -impl dsernag.re
///////////////////////////////////////////////////////////////////////////////
let rec gcdResult = (a_val : int, b_val : int) => {
  if (b_val == 0) {
    a_val;
  } else {
    gcdResult(b_val, a_val mod b_val);
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
    let gcd = gcdResult(a_val, b_val);
    let lcm = (a_val * b_val) / gcd;
    print_char('(');
    print_int(gcd);
    print_char(' ');
    print_int(lcm);
    print_char(')');
    print_char(' ');
    readLines(lines - 1);
  }
}
///////////////////////////////////////////////////////////////////////////////
readLines(int_of_string(input_line(stdin)));
print_newline();
///////////////////////////////////////////////////////////////////////////////
/*
  cat DATA.lst | ./dsernag
  (184 102672) (63 193914) (24 32760) (1 8304535) (2 3639798) (378 11340)
  (1 1181110) (51 64872) (1 1596) (1 36256) (42 244440) (10 200) (1 146)
  (407 29304) (15 64155) (92 90988) (71 276474) (1 8280)
*/
