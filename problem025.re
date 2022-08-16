// ocamlc -o dsernag -pp "refmt -p ml" -impl dsernag.re
include Int64;
let rec nextLCG = (a_val , c_val , m_val , x_init , n_loops) => {
  if (n_loops <= zero) {
    x_init;
  } else {
    let x_init = rem(add(mul(a_val, x_init), c_val), m_val);
    nextLCG(a_val, c_val, m_val, x_init, sub(n_loops, of_int(1)));
  }
}
//Read each line:
let rec readLines = (amount : int) => {
  if (amount <= 0) {
    ();
  } else {
    let line = Array.of_list(String.split_on_char(' ', input_line(stdin)));
    // Remember values are: A, C, M, X0, N
    let intLine = Array.map(number => of_string(number), line);
    let a_val = intLine[0];
    let c_val = intLine[1];
    let m_val = intLine[2];
    let x_init = intLine[3];
    let n_loops = intLine[4];

    let sol = nextLCG(a_val, c_val, m_val, x_init, n_loops);
    print_string(to_string(sol));
    print_string(" ");
    readLines(amount - 1);
  }
}
// Main runing
readLines(int_of_string(input_line(stdin)));
print_newline();

/*
  cat DATA.lst | ./dsernag
  2656 11 65708 238 17 91650 0 0 15 7743 2462 48741 13287 2 127
*/
