(defun insert (item sorted)
  "Insert item into the correct position in sorted order."
  (if (or (null sorted) (<= item (car sorted)))
      (cons item sorted)
      (cons (car sorted) (insert item (cdr sorted)))))

(defun insertion-sort-helper (unsorted sorted)
  "Recursively sorts unsorted list by inserting each item into sorted list."
  (if (null unsorted)
      sorted
      (insertion-sort-helper (cdr unsorted) (insert (car unsorted) sorted))))

(defun insertion-sort (lst)
  "Wrapper function for insertion sort."
  (insertion-sort-helper lst '()))

;; Testing the function
(print (insertion-sort '(3 1 4 1 5 9 2 6 5 3 5)))
;; Output: (1 1 2 3 3 4 5 5 5 6 9)