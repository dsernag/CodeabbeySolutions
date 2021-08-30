; hyc dsernag.hy
; Compiling dsernag.hy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require [hy.contrib.loop [loop]])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Function to read
(defn returnxyValues[]
  (setv rangeInput (.split (input)))
  (setv rangeYears (- (int (get rangeInput 1)) (int (get rangeInput 0))))

  (setv xValues [])
  (setv yValues [])

  (do
    (loop [[i 0]]
      (if (> i rangeYears)
        [xValues yValues]
        (do
          (setv entryline (.split (input)))
          (.append xValues (int (get entryline 1)))
          (.append yValues (int (get entryline 2)))
          (recur (inc i)))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Function to return mean
(defn calculateMeans[values]
  (setv size (len values))
  (do
    (loop[[i 0][suma 0]]
      (if (>= i size)
        (/ suma size)
        (recur (inc i) (+ suma (get values i)))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Find slope:
(defn findSlope[xyValues]
  (setv xValues (get xyValues 0))
  (setv yValues (get xyValues 1))
  (setv xMean (calculateMeans xValues))
  (setv yMean (calculateMeans xValues))
  (setv size (len xValues))

  (do
    (loop[[i 0] [numerator 0] [denominator 0]]
      (if (>= i size)
        (/ numerator denominator)
        (recur
          (inc i)
          (+ numerator (* (- (get xValues i) xMean) (- (get yValues i) yMean)))
          (+ denominator (pow (- (get xValues i) xMean) 2)))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Find interception:
(defn findInterception[xyValues]
  (setv slope (findSlope xyValues))
  (setv xMean (calculateMeans (get xyValues 0)))
  (setv yMean (calculateMeans (get xyValues 1)))
  (- yMean (* slope xMean)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn printing[]
  (setv xyValues (returnxyValues))
  (print (findSlope xyValues) (findInterception xyValues)))

(printing)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; cat DATA.lst | hy dsernag.hy
; 1.6097618194945307 119.26159064054207
