; hyc dsernag.hy
; Compiling dsernag.hy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require [hy.contrib.loop [loop]])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Function to obtain two arrays in a list. The weights and vals
(defn getWeightValue[elements]
  (setv weights [])
  (setv vals [])
  (do
    (loop[[iIndex 0]]
      (if (>= iIndex elements)
        [weights vals]
        (do
          (setv entryLine (.split (input)))
          (.append weights (int (get entryLine 0)))
          (.append vals (int (get entryLine 1)))
          (recur (inc iIndex)))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Auxiliar loop
(defn auxiliarLoop [iIndex WT_Const weights vals kMatrix]
  (loop [[jIndex 0]]
    (if (>= jIndex (+ WT_Const 1))
      None
      (do
        (if (or (= iIndex 0) (= jIndex 0))
          (do
            (setv (get (get kMatrix iIndex) jIndex) 0)
            (recur (inc jIndex)))
          (do
            (if (<= (get weights (- iIndex 1)) jIndex)
              (do
                (setv (get (get kMatrix iIndex) jIndex)
                  (max (+ (get vals (- iIndex 1))
                    (get (get kMatrix (- iIndex 1))
                      (- jIndex (get weights (- iIndex 1)))))
                        (get (get kMatrix (- iIndex 1)) jIndex)))
                (recur (inc jIndex)))
              (do
                (setv (get (get kMatrix iIndex) jIndex)
                  (get (get kMatrix (- iIndex 1)) jIndex))
                (recur (inc jIndex))))))))))

; Function to obtain two arrays in a list. The weights and values
(defn knapSackMatrix [WT_Const weights vals elem kMatrix]
  ; There must be one loop through every element and then for every range
  ; The second loop will be an auxiliar function
  (do
    (loop [[iIndex 0]]
      (if (>= iIndex (+ elem 1))
        None
        (do
          (auxiliarLoop iIndex WT_Const weights vals kMatrix)
          (recur (inc iIndex))))))
  (return kMatrix))

; Function to go over KMatrix and check what items were added
(defn returnIndexes [WT_Const weights vals elem kMatrix]
  (setv maxRes (get (get kMatrix elem) WT_Const))
  (setv indexes [])
  (do
    (loop [[iIndex elem] [res maxRes] [wIndex WT_Const]]
      (if (< iIndex 0)
        None
        (if (<= res 0)
          None
          (if (= res (get (get kMatrix (- iIndex 1)) wIndex))
            (recur (dec iIndex) res wIndex)
            (do
              (.append indexes (- iIndex 1))
              (recur (dec iIndex) (- res (get vals (- iIndex 1)))
                (- wIndex (get weights (- iIndex 1))))))))))
    (return indexes))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Main function
(defn main[]
  (setv elem (int (input)))
  (setv WT_Const (int (input)))

  (setv valWeights (getWeightValue elem))

  (setv weights (get valWeights 0))
  (setv vals (get valWeights 1))

  ;Create the matrix K and filled with the knapsack function
  (setv kMatrix (lfor x (range 0 (+ elem 1))
    (lfor x (range 0 (+ WT_Const 1)) 0)))
  (setv kMatrixFilled (knapSackMatrix WT_Const weights vals elem kMatrix))

  ; Return the indices, get their size, and loop in descending order
  (setv indexes (returnIndexes WT_Const weights vals elem kMatrixFilled))
  (setv lenIndexex (dec (len indexes)))
  (do
    (loop [[index lenIndexex]]
      (if (< index 0)
        None
        (do
          (print :end " " (get indexes index))
          (recur (dec index)))))))
(main)
(print "")

; cat DATA.lst | hy dsernag.hy
; 0 1 2 11 12 13 15 16 18 19 21 25 26 28 31 42 46 48 49 51 52 53 54 55 58 61
; 63 66 68 70 71 72 73 76 79 80 81 83 84 87 88 90 92 94 96 100 102 103 104
; 108 109 110 112 114 119 120 122 125 127
