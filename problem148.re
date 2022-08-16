/*
ocamlfind ocamlc -package zarith -linkpkg -o dsernag -pp "refmt -p ml"
-impl dsernag.re
*/
///////////////////////////////////////////////////////////////////////////////
include Z;
// Extended Euclidean Algorithm
let rec gcdExten = (a_val, b_val) => {
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
// Return positive modulus:
let rec positiveResult = (modulus, value) => {
  if (value >= zero) {
    value;
  } else {
    positiveResult(modulus, add(value, modulus));
  }
}
///////////////////////////////////////////////////////////////////////////////
// Return inverseModulus of any number
let inverseMod = (number, modulus) => {
  let result = gcdExten(number, modulus);
  let inverse = result[1];
  positiveResult(modulus, inverse);
}
///////////////////////////////////////////////////////////////////////////////
let rec getEval = (pValue, peValue, modulus, counter) => {
  if (powm_sec(pValue, counter, modulus) == peValue) {
    counter
  } else {
    getEval(pValue, peValue, modulus, pred(counter))
  }
}
///////////////////////////////////////////////////////////////////////////////
let rec decodeWord = (abc, messageCode, word, counter, cons) => {
  if (counter > of_int(3)) {
    word;
  } else {
    let index = to_int(rem(messageCode, cons));
    let letter = (abc.[index]);
    let word = Array.append(word, [|letter|]);
    decodeWord(abc, div(messageCode, cons), word, succ(counter), cons);
  }

}
///////////////////////////////////////////////////////////////////////////////
// Read word: (Every next line is a word) (pk, c):
let rec readWord = (pVal, peVal, modulus, eVal, lines) => {
  if (lines <= zero) {
    ();
  } else {
    let inputKey = Array.of_list(String.split_on_char(' ', input_line(stdin)));
    let inputKeyInt = Array.map(number => of_string(number), inputKey);

    // Separte both values:
    let pkVal = inputKeyInt[0];
    let cVal = inputKeyInt[1];

    let inversePke = inverseMod(pow(pkVal, to_int(eVal)), modulus);
    let messageCode = rem(mul(cVal, inversePke), modulus);
    let abc = "abcdefghijklmnopqrstuvwxyz";

    let word = decodeWord(abc, messageCode, [||] ,of_int(0), of_int(31));
    print_char(word[3]);
    print_char(word[2]);
    print_char(word[1]);
    print_char(word[0]);
    print_string(" ");
    readWord(pVal, peVal, modulus, eVal, pred(lines));
  }
}
///////////////////////////////////////////////////////////////////////////////
// Main function
let main = (lines) => {
  let inputVals = Array.of_list(String.split_on_char(' ', input_line(stdin)));
  let inputInt = Array.map(number => of_string(number), inputVals);
  // Second line is (n, p, pe):
  let modulus = inputInt[0];
  let pVal = inputInt[1];
  let peVal = inputInt[2];
  // Find the value of e
  let eVal = getEval(pVal, peVal, modulus, modulus);

  // Read each pair of keys and print the word
  readWord(pVal, peVal, modulus, eVal, lines);
}
///////////////////////////////////////////////////////////////////////////////
main(of_string(input_line(stdin)));
print_newline();
///////////////////////////////////////////////////////////////////////////////
/**
  cat DATA.lst | ./dsernag
  lock page fate keep ring word calm
*/
