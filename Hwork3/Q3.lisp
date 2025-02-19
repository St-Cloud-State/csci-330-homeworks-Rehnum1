(defun merge-lists (lst1 lst2)
  "Merges two sorted lists into one sorted list."
  (cond
    ((null lst1) lst2)
    ((null lst2) lst1)
    ((<= (car lst1) (car lst2)) (cons (car lst1) (merge-lists (cdr lst1) lst2)))
    (t (cons (car lst2) (merge-lists lst1 (cdr lst2))))))

(defun partition-into-pairs (lst)
  "Splits the list into sorted pairs."
  (if (null lst) 
      '()
      (if (null (cdr lst)) 
          (list (list (car lst)))  ;; Single element case
          (cons (sort (list (car lst) (cadr lst)) #'<) 
                (partition-into-pairs (cddr lst))))))

(defun merge-pass (sublists)
  "Performs one merging pass on a list of sorted sublists."
  (if (null sublists)
      '()
      (if (null (cdr sublists))
          sublists
          (cons (merge-lists (car sublists) (cadr sublists))
                (merge-pass (cddr sublists))))))

(defun bottom-up-mergesort (lst)
  "Performs bottom-up merge sort iteratively."
  (let ((sublists (partition-into-pairs lst)))
    (loop while (> (length sublists) 1) 
          do (setf sublists (merge-pass sublists)))
    (car sublists)))  ;; Return the sorted list

;; Testing
(print (bottom-up-mergesort '(1 7 2 1 8 6 5 3 7 9 4)))
;; Output: (1 1 2 3 4 5 6 7 7 8 9)