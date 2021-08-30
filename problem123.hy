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
(defn knapSack [WT_Const weights vals elem kMatrix]
  ; There must be one loop through every element and then for every range
  ; The second loop will be an auxiliar function
  (do
    (loop [[iIndex 0]]
      (if (>= iIndex (+ elem 1))
        None
        (do
          (auxiliarLoop iIndex WT_Const weights vals kMatrix)
          (recur (inc iIndex))))))
  (return (get (get kMatrix elem) WT_Const)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Main function
(defn main[]
  (setv elem (int (input)))
  (setv WT_Const (int (input)))

  (setv valWeights (getWeightValue elem))

  (setv weights (get valWeights 0))
  (setv vals (get valWeights 1))

  ;Create the matrix K)
  (setv kMatrix (lfor x (range 0 (+ elem 1)) (lfor x (range 0 (+ WT_Const 1)) 0)))

  (print (knapSack WT_Const weights vals elem kMatrix)))

(main)

; cat DATA.lst | hy dsernag.hy
; 3315
