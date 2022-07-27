; Problem description
(define (problem city1)
  (:domain letterGame)

  (:objects s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 mailman
  box1 house1 house2 letter1 letter2)

  (:init
    ; City construction
    (spot s1) (spot s2) (spot s3)
    (spot s4) (spot s5) (spot s6)
    (spot s7) (spot s8) (spot s9)
    (spot s10) (spot s11) (spot s12)
    (spot s13) (spot s14)
    (courier mailman)
    (box box1)
    (house house1) (house house2)
    (letter letter1) (letter letter2)
    
    ; Road construction
    (road s1 s2) (road s2 s1)
    (road s2 s3) (road s3 s2)
    (road s2 s11) (road s11 s2)
    (road s3 s4) (road s4 s3)
    (road s4 s5) (road s5 s4)
    (road s5 s12) (road s12 s5)
    (road s11 s6) (road s6 s11)
    (road s11 s9) (road s9 s11)
    (road s6 s10) (road s10 s6)
    (road s9 s10) (road s10 s9)
    (road s10 s8) (road s8 s10)
    (road s8 s13) (road s13 s8)
    (road s13 s14) (road s14 s13)
    
    ; Blue line subway construction
    (blue s2 s3) 
    (blue s3 s5)
    (blue s5 s7)
    (blue s7 s8)
    (blue s8 s6)
    (blue s6 s2)
    
    ; Red line subway construction
    (red s5 s7)
    (red s7 s8)
    (red s8 s6)
    (red s6 s5)
    
    ; Station construction
    (station s2) (station s3) (station s7)
    (station s8) (station s6)
    
    ; Mailman position
    (at mailman s14)
    
    ; House position
    (has_house s10 house1)
    (has_house s13 house2)
    
    ; Letter position
    (has_letter house1 letter1)
    (has_letter house2 letter2)
    
    ; Box position
    (has_box s7 box1)

  )

  (:goal (and
    ; All letters are in a box
    (sent letter1)
    (sent letter2)
  ))
)
