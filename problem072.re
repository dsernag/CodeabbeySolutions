//ocamlc -o dsernag -pp "refmt -p ml" -impl dsernag.re
include Int64;
// Check if index is pair
let checkPair = (index) => {
  rem(index, of_int(2)) == of_int(0);
}
// Print a vowel from the list
let printVowel = (index) => {
  print_char("aeiou".[index]);
}
// Print a consonant from the list
let printCons = (index) => {
  print_char("bcdfghjklmnprstvwxz".[index]);
}
// Recursive Linear Congruential Generator
let rec nextLCG = (aVal , cVal , mVal , seed , n_letters, countLett) => {
  if (countLett > n_letters) {
    seed;
  } else {
    let seed = rem(add(mul(aVal, seed), cVal), mVal);
    if (checkPair(countLett)) {
      let vowel = rem(seed, of_int(5));
      printVowel(to_int(vowel));
      nextLCG(aVal, cVal, mVal, seed, n_letters, add(countLett, of_int(1)));
    } else {
      let cons = rem(seed, of_int(19));
      printCons(to_int(cons));
      nextLCG(aVal, cVal, mVal, seed, n_letters, add(countLett, of_int(1)));
    }
  }
}
//Read each line:
let rec readWords = (amount, values, counterWords, seed) => {
  if (counterWords >= amount) {
    ();
  } else {
    let aVal = of_int(445);
    let cVal = of_int(700001);
    let mVal = of_int(2097152);
    let n_letters = values[to_int(counterWords)];

    // Keep tracking the seed to avoid restart
    let seed = nextLCG(aVal, cVal, mVal, seed, n_letters, of_int(1));
    print_string(" ");
    readWords(amount, values, add(counterWords, of_int(1)), seed);
  }
}
// Main function
let main = () => {
  let entrada = Array.of_list(String.split_on_char(' ', input_line(stdin)));
  let intLine = Array.map(number => of_string(number), entrada);
  // First value amount of words, second value Seed value:
  let amountWords = intLine[0];
  let seed = intLine[1];

  let valsEntry = Array.of_list(String.split_on_char(' ', input_line(stdin)));
  let intEntry = Array.map(number => of_string(number), valsEntry);

  readWords(amountWords, intEntry, zero, seed);
}
// Main runing
main()
print_newline();

/*
  cat DATA.lst | ./dsernag
  var hemeseme fuvelafo beb fozeh papomizo gizihux gekofak fepifun xaju rec
  bipivo vucupo wezewop laturage sapudu gilu waga
*/
