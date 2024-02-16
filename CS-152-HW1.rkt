;;; CS 152
;;; Boss Mode



;;; Question 1:
;;; Function discriminant: three numbers -> number
;;; Returns the discriminant of three given numbers


(define
  (discriminant a b c)
  (-(* b b) (* 4 a c)))



;;;Question 2:
;;;Function flip: list -> list
;;; A function that takes in a list and returns a list with each pair
;;; of the consecutive words flipped
(define
 (flip xs)
  (cond (( null? xs) '()) ; base
        ((null? (cdr xs)) xs) ; checks to see if remainder of list is empty
        (else (cons (car(cdr xs)) (cons (car xs) (flip (cddr xs)))))))



;;;Question 3
;;;Function triple: list -> list
;;; A fucntion that takes in a list and returns a new list where the items
;;; from the original list are repeated three times
(define
  (triple xs)
   (cond (( null? xs) '()) ;base case
        (else (cons (car xs) (cons (car xs) (cons (car xs) (triple (cdr xs)))))))) 

;;;Question 4
;;;Function all-but-last: list -> list
;;; A function that takes in a list and returns the list without the last element,
;;; or an empty list if given an empty list
(define
  (all-but-last xs)
  (cond ((null? xs) '()) ;base case
        ((null? (cdr xs)) '())
          (else(cons (car xs) (all-but-last (cdr xs))))))


;;; Question 5
;;; Function max-list : two lists -> list
;;; Function creates a new list by taking maximum
;;; of each index.
(define (max-list xs ys)
  (cond((and (null? xs) (null? ys)) '()) ; base case - if both xs and ys are empty, return empty list, occurs when length of xs and ys are same
    ((null? xs) ys) ; if xs is empty, return the reamainder of ys
    ((null? ys) xs) ; if ys is empty, return the remainder of xs
    (else (cons (max (car xs) (car ys)) (max-list (cdr xs) (cdr ys)))))) ; otherwise, recursively construct the max of xs vs ys with call to max list


;;;Question 6
;;; Predicate flat? :  list -> boolean
;;;  This predicate will return #f if list contains a nested list, else it returns #t

(define (flat? xs)
  (cond((null? xs) #t) ;; if our list is empty, return true
   ((list? (cdr xs)) #f) ; if the cdr returns a list, we have found a list,so return alse 
   (else (flat? (cdr xs))))) ; recursivelly call flat?

  
;;; Question 7
;;; Function count-numbers : list -> number
;;; This functio nreturns the count of the numbers in a list or its nested components
;;; TODO
(define (count-numbers xs)
  (cond((null? xs) 0) ;base case, if our input list is empty, return 0
  ((number? (car xs)) (+ 1(count-numbers (cdr xs)))) ; if number, add one and recurisvelly recall count-numbers on list
  ((list? (cdr xs)) (+ 1 (count-numbers (cdr xs))))
  (else (count-numbers (cdr xs)))))

        





