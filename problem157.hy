; hyc dsernag.hy
; Compiling dsernag.hy

(import random)
(require [hy.contrib.loop [loop]])

; Inspired by:
; https://www.geeksforgeeks.org/primality-test-set-3-miller-rabin/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Miller Rabin Test;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Auxiliar loop miller
(defn whileLoopMiller [dValue xValue number]
  (loop [[dLoop dValue] [xLoop xValue]]
    (if (> dLoop (- number 1))
      (return False)
      (do
        (if (= xLoop 1)
          (return False))
        (if (= xLoop (- number 1))
          (return True))
        (recur (* dLoop 2) (% (* xLoop xLoop) number))))))

;Implementation of MillerTest:
(defn millerTest [dValue number]

  (setv aValue (+ 2 (.randint random 1 (- number 4))))
  
  (setv xValue (pow aValue dValue number))
  
  (if (or (= xValue 1) (= xValue (- number 1)))
    (return True))

  (if (= dValue (- number 1))
    (return False))

  (whileLoopMiller dValue xValue number))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Is Prime Implementation;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Auxiliar Function to run a while inside isPrime
(defn whileLoopPrime [value]
    (loop [[dValue (- value 1)]]
        (if (!= (% dValue 2) 0)
            (return dValue)
            (recur (// dValue 2)))))

; Auxiliar function to iterate over k values:
(defn forLoopK [dValue number kConstat]
  (loop[[i 0]]
    (if (= i kConstat)
      (return True)
      (if (= (millerTest dValue number) False)
        (return False)
        (recur (inc i))))))

; Is prime functiopn
(defn isPrime [number kConstat]
  ; Primitive Cases
  (if (or (<= number 1) (= number 4))
    (return False))
  (if (<= number 3)
    (return True))
  (setv dValue (whileLoopPrime number))
  (forLoopK dValue number kConstat))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;Is PrimEmirp Implementation;;;;;;;;;;;;;;;;;;;;;;;;;
(defn isEmirp [original swaped]
  (if (and (isPrime original 4) (isPrime swaped 4))
    True))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;Swap Position;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn Swap [entry]
  (setv entryString (str entry))
  (setv size (len entryString))
  (setv rEntry [])
  (do
    (loop [[var (- size 1)]]
      (if (< var 0)
        (return rEntry)
        (do
          (.append rEntry (get entryString var))
          (recur (- var 1))))))
  (return (int (.join "" rEntry))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;Generating series of Primes;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Auxiliar function to check if number doesn't start in 2 4 5 6 8
; Really especific for this algorith
(defn emirpShourtCut [value]
  (setv firstDigit (get (str value) 0))
  (setv size (len (str value)))
  (cond
    [(= firstDigit "2") (return (* 3 (pow 10 22)))]
    [(or (= firstDigit "4") (= firstDigit "5") (= firstDigit "6")) 
      (return (* 7 (pow 10 22)))]
    [(= firstDigit "8") (return (* 9 (pow 10 22)))])
  (return value))

;The generator of the series
(defn findNextPrime [entry limit]
  (setv start (emirpShourtCut entry))
  (do
    (loop [[i start]]
      (if (> i limit)
        None
        (if (= (% i 2) 0)
          (recur (+ i 1))
          (if (or (= (% i 3) 0) (= (% i 5) 0) (= (% i 7) 0) (= (% i 11) 0))
            (recur (+ i 2))
            (do
              (setv swaped (Swap i))
              (if (isEmirp i swaped)
                (print :end " " i)
                ;(print :end " " i "-Diferencia:" (- i start)"|||")
                (recur (+ i 2))))))))))         
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Main function;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;:
(defn mainFunction [start]
  (setv limit (* start 2))
  (findNextPrime start limit))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Read each line;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn readLines [lines counter]
  (if (>= counter lines)
    None
    (do
      (setv line (int (input)))
      (mainFunction line)
      (readLines lines (inc counter)))))

;;Run the reader
(readLines (int (input)) 0)
(print "")

; cat DATA.lst | hy dsernag.hy
; 70880919447052613764997 70814551362513949286321 70000000000000000000859
; 70188884027475090199039 70000000000000000000859 90023374487626982177593
; 30000000000000000000047 90245764396240921067657 90719521663456605146873
; 10471700814817118895581 90000000000000000000001 10949694735573928566097
; 30924974663611558541633 10862610044344926027497 70000000000000000000859
; 30497035774315053392411 30685110462640520913553 70450072221758195956177
; 70314679114633953996859 70000000000000000000859 70635370687689512557759
; 70000000000000000000859 90459776410732288736471
