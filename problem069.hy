; hyc dsernag.hy
; Compiling dsernag.hy

(require [hy.contrib.loop [loop]])

(defn fiboTOC [limit modulo]
  (loop [[i limit] [curr 0] [next 1]]

  (if (= (% next modulo) 0)
    (print :end " " (+ 1 (- limit i)))
    (if (= limit 0)
      (print :end " " 0)
      (if (= limit 1)
        (print :end " " 1)
        (if (= i 0)
          None
          (do
            (recur (dec i) next (+ curr next)))))))))

;Read the line and obtain the info
(defn readLines [elements counter values]
  (if (>= counter elements)
    None
    (do
      (setv actualValue (int (get values counter)))
      (fiboTOC (* actualValue actualValue) actualValue)
      (readLines elements (inc counter) values))))

;Run the reader
(readLines (int (input)) 0 (.split (input)))
(print "")

; cat DATA.lst | hy dsernag.hy
; 1176 900 900 54 100 3300 840 96 1246 396 1592 2064 270 2100 264 3040 552 300 1000
