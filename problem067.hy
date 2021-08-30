; hyc dsernag.hy
; Compiling dsernag.hy

(require [hy.contrib.loop [loop]])

(defn fiboTOC [limit]
  (loop [[i limit] [curr 0] [next 1]]

  (if (= next limit)
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
(defn readLines [lines counter]
  (if (>= counter lines)
    None
    (do
      (setv line (int (input)))
      (fiboTOC line)
      (readLines lines (inc counter)))))

;Run the reader
(readLines (int (input)) 0)
(print "")

; cat DATA.lst | hy dsernag.hy
; 896 26 184 891 539 158 87 64 770 294 994 290 628 134 745 534 773 406
