; hyc dsernag.hy
; Compiling dsernag.hy

(require [hy.contrib.loop [loop]])

(defn fiboTOC [entry modulo]
  (loop [[i entry] [curr 0] [next 1]]

  (setv index (+ 1 (- entry i)))
  (if (= (% next modulo) 0)
    (print :end " " index)
    (if (= entry 0)
      (print 0)
      (if (= entry 1)
        (print 1)
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
      (fiboTOC 1500000 actualValue)
      (readLines elements (inc counter) values))))

;Run the reader
(readLines (int (input)) 0 (.split (input)))
(print "")

; cat DATA.lst | hy dsernag.hy
; 132804 57057 22050 857744 71100 18810 607968 8100 66300 68100 1007598 73308
; 29400 298338 81603 95676 47340 1186800 270 684 123000 1015890 147480
