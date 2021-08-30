; hyc dsernag.hy
; Compiling dsernag.hy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PACKAGES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require [hy.contrib.loop [loop]])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ERATOSTHENES SIEVE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; First I will create a list with all the primes using the sievE
; Integer sqrt
(defn isqrt[number]
  (int (pow number 1/2)))
; Second Loop for eratosthenes
(defn secondLoop [number iValue list]
  (loop [[x (* iValue iValue)]]
    (if (> x number)
      list
      (do
        (setv (get list x) 0)
        (recur (+ x iValue))))))
; first Loop for eratosthenes
(defn eratosthenesLoop [number list]
  (loop [[i 2]]
    (if (= i  (isqrt number))
      list
      (do
        (secondLoop number i list)
        (recur (inc i))))))
; The constructor
(defn primeList[limit]
  (setv listPrimes (list (range 0 (+ limit 1))))
  (setv matrix (eratosthenesLoop limit listPrimes))
  (setv matrixPrimes (lfor x matrix :if (!= x 0) x))
  matrixPrimes)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FIND THE FACTORS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; helper function simulate a while loop in the prime number
; because the number could be divisible several times by the same prime nubmer
(defn whileFactor[remainder primeNumber factors]
  (loop [[remainder2 remainder]]
    (if (!= (% remainder2 primeNumber) 0)
      None
      (do
        (.append factors primeNumber)
        (recur (/ remainder2 primeNumber))))))
; Takes the number and iterate over a list of primes
(defn findfactors[entryNumber]
  (setv arrayPrimes (primeList 1000))
  (setv factors [])
  (loop [[i 1] [accum 1] [remainder entryNumber]]
    (if (>= i (len arrayPrimes))
      factors
      (if (= (% remainder (get arrayPrimes i)) 0)
        (do
          ;(.append factors (get arrayPrimes i))
          (whileFactor remainder (get arrayPrimes i) factors)
          (recur
            (inc i)
            (* accum (get arrayPrimes i))
            (/ remainder (get arrayPrimes i))))
        (recur (inc i) accum remainder)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PRINTER;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Given the pattern of printing I will implement a function
(defn printer[listFactors]
  (setv size (len listFactors))
  (loop [[i 0]]
    (if (>= i size)
      None
      (if (= i 0)
        (do
          (print :end "" (get listFactors i))
          (recur (inc i)))
        (do
          (print :end "" "*")
          (print :end "" (get listFactors i))
          (recur (inc i)))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MAIN;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Read first line and obtain the amount of entries
(defn main[]
  (setv size (int(input)))
  (loop[[i 0]]
    (if (>= i size)
      None
      (do
        (setv entryNumber (int (input)))
        (printer (findfactors entryNumber))
        (print :end " ")
        (recur (inc i))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(main)
(print "")
;
; cat DATA.lst | hy dserang.hy
;
