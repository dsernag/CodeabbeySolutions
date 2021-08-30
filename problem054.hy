; hyc dsernag.hy
; Compiling dsernag.hy

;This problem was solved thanks to:
;Pythagorean Triples Generator:
;https://www.youtube.com/watch?v=n6vL2KiWrD4

;Also understand the escence of tail call optimization
;https://stackoverflow.com/questions/310974/what-is-tail-call-optimization

;And of course, to the documentation of hy:
;https://docs.hylang.org/en/alpha/api.html?highlight=loop#module-hy.contrib.loop

;So we will use integers m and n to produce triples
;Possibly will ommit the entire space of triples, but let's try

(require [hy.contrib.loop [loop]])

; This function generate the triples
(defn genTrip [m_generator n_generator]
  ; The three variables
  (setv tripleValues
    [(* 2 m_generator n_generator)
    (- (* m_generator m_generator) (* n_generator n_generator))
    (+ (* m_generator m_generator) (* n_generator n_generator))
    (* (* 2 m_generator) (+ m_generator n_generator))])
  (return tripleValues))

; This is the second loop trough n values
(defn secondLoop [limit m_entry n_entry entrySum]
  (loop [[j_count m_entry] [n_count 1]]
    (setv tripleValues (genTrip m_entry n_count))
    (setv realSum (get tripleValues 3))

    (if (= j_count 1)
      None
      (do
        (if (= realSum entrySum)
          (do
            (print :end " " (* (get tripleValues 2) (get tripleValues 2)))
            (return realSum))
          (recur (dec j_count) (inc n_count)))))))

; Main loop through m value
(defn mainLoop [limit m_entry n_entry entrySum]
  (loop [[i_count limit] [m_count m_entry]]
    (setv tripleValues (genTrip m_count n_entry))
    (if (= i_count 0)
      None
      (do
        (if (> m_count limit)
          None
          (do
            (setv realSum(secondLoop limit m_count n_entry entrySum))
            (if (= realSum entrySum)
              None
              (recur (dec i_count) (inc m_count)))))))))

;Read the line and obtain the info
(defn readLines [lines counter]
  (if (>= counter lines)
    None
    (do
      (setv line (int (input)))
      ; Because we are trying to find millions
      ; We put a 5K limit starting from 1500
      (mainLoop 5000 2 1 line)
      (readLines lines (inc counter)))))

;Run the reader
(readLines (int (input)) 0)
(print "")

; cat DATA.lst | hy dsernag.hy
; 40903660986409 49987855303681 46145949472561 28578700269025
; 54497364066289 37827580070569 37807950499489