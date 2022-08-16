
/*
ocamlfind ocamlc -package num -linkpkg -o dsernag -pp "refmt -p ml"
-impl dsernag.re
*/

// Inspired by : https://tailcall.net/posts/cracking-rngs-lcgs/
// Libraries:
open Num;
///////////////////////////////////////////////////////////////////////////////
// Extended Euclidean Algorithm
//https://introcs.cs.princeton.edu/java/99crypto/ExtendedEuclid.java.html
let rec gdcExtended = (a_val : num, b_val : num) => {
  if (b_val == num_of_int(0)) {
    [| a_val, num_of_int(1), num_of_int(0)|];
  } else {
    let vals = gdcExtended(b_val, mod_num(a_val, b_val));
    let gcd = vals[0];
    let x_val = vals[2];
    let y_val = sub_num(vals[1], mult_num(quo_num(a_val, b_val), vals[2]));
    [| gcd, x_val, y_val|]
  }
}
///////////////////////////////////////////////////////////////////////////////
// Return positive modulus:
let rec positiveResult = (modulus : num, value : num) => {
  if (value >= num_of_int(0)) {
    value;
  } else {
    positiveResult(modulus, add_num(value, modulus));
  }
}
///////////////////////////////////////////////////////////////////////////////
// Return inverseModulus of any number
let inverseMod = (number : num, modulus : num) => {
  let result = gdcExtended(number, modulus);
  let inverse = result[1];
  positiveResult(modulus, inverse);
}
///////////////////////////////////////////////////////////////////////////////
// Return next value from LCG series
let nextLCG = (a_val : num, c_val : num, modulus : num, x_curr : num) => {
  mod_num(add_num(mult_num(a_val, x_curr), c_val), modulus)
}
///////////////////////////////////////////////////////////////////////////////
// Main function to read lines and operate
let rec readLines = (lines:int) => {
  if (lines <= 0) {
    ();
  } else {
    let line = Array.of_list(String.split_on_char(' ', input_line(stdin)));
    let intLine = Array.map(number => num_of_string(number), line);
    // Series of values
    let s1_val = intLine[0];
    let s2_val = intLine[1];
    let s3_val = intLine[2];
    // Modulus (Supose is knowed) From Dummie example:
    let modulus : num = num_of_string("18446744073709551616");
    let a_val = mod_num(mult_num((s3_val -/ s2_val),
      (inverseMod((s2_val -/ s1_val), modulus))), modulus);
    let c_val = mod_num((s3_val -/ (a_val *\/ s2_val)), modulus);

    let answer = nextLCG(a_val, c_val, modulus, s3_val);
    print_string(string_of_num(answer));
    print_string(" ");

    readLines(lines - 1);
  }
}
///////////////////////////////////////////////////////////////////////////////
readLines(int_of_string(input_line(stdin)));
print_newline();
///////////////////////////////////////////////////////////////////////////////

/**
  cat DATA.lst | ./dsernag
  5566917377959948177 9061886456020456416 14917553672688260893
  11128584175327010833 2064615534286018944 2282284654814438851
  12013737371904471908 9721961983393031808 7430218788191336026
  16987833973894367991 6790843372176263481 4086280127298800497
  4306076525441147493 1732579074739981863 257494082135436927
  7766981518770544997 3849573696163337033 13109146924332431870
  6873682285714843998 9297243081037154656 3886196780338098146
  15136400330543661438 10247125463357427523 9991969993187153962
 */
