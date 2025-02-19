(defun insert (item sorted)
  (if (or (null sorted) (<= item (car sorted)))
      (cons item sorted)
      (cons (car sorted) (insert item (cdr sorted)))))

(defun insertion-sort (unsorted sorted)
  (if (null unsorted)
      sorted
      (insertion-sort (cdr unsorted) (insert (car unsorted) sorted))))

(defun sort-list (lst)
  (insertion-sort lst '()))

;; Call the function at the end to test
(print (sort-list '(3 1 4 1 5 9 2 6 5 3 5)))
