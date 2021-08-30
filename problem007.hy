; hyc dsernag.hy
; Compiling dsernag.hy

(require [hy.contrib.loop [loop]])

; Implement a rounding function
(defn rounding [value]
  (setv roundValue (int value))
  (setv diff (- value roundValue))
  (if (>= diff 0.5)
    (return (+ roundValue 1))
    (return roundValue)))

;To celcius
(defn fahToCel []
  (setv entrada (.split (input)))
  (setv nValues (int (get entrada 0)))
  (do
    (loop [[i 1]]
      (if (> i nValues)
        None
        (do
          (setv fahValue (float (get entrada i)))
          (setv celcius (* (- fahValue 32) 5/9))
          (print :end " " (rounding celcius))
          (recur (inc i)))))))

; Run function
(fahToCel)
(print "")

; cat DATA.lst | hy dsernag.hy
; 226 151 7 26 11 171 48 174 82 204 216 143 9 116 112 220 50 99 243 163 306
; 99 58 245 112 16 59 244 247 224 121 179 259 223 151 107 173 32 266 51 