; Problem description
(define (problem city2)
  (:domain letterGame)

  (:objects 
  s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20
  mailman1 mailman2 
  box1 box2 
  house1 house2 house3 house4 house5 house6 house7
  letter1 letter2 letter3 letter4 letter5)

  (:init
    ; City construction
    (spot s1) (spot s2) (spot s3)
    (spot s4) (spot s5) (spot s6)
    (spot s7) (spot s8) (spot s9)
    (spot s10) (spot s11) (spot s12)
    (spot s13) (spot s14) (spot s15)
    (spot s16) (spot s17) (spot s18)
    (spot s19) (spot s20)
    (courier mailman1) (courier mailman2)
    (box box1) (box box2)
    (house house1) (house house2) (house house3)
    (house house4) (house house5) (house house6) (house house7)
    (letter letter1) (letter letter2) (letter letter3)
    (letter letter4) (letter letter5)
    
    ; Road construction
    (road s1 s2) (road s2 s1)
    (road s2 s3) (road s3 s2)
    (road s2 s8) (road s8 s2)
    (road s3 s4) (road s4 s3)
    (road s4 s5) (road s5 s4)
    (road s4 s19) (road s19 s4)
    (road s19 s20) (road s20 s19)
    (road s5 s6) (road s6 s5)
    (road s5 s7) (road s7 s5)
    (road s7 s12) (road s12 s7)
    (road s8 s9) (road s9 s8)
    (road s9 s10) (road s10 s9)
    (road s10 s11) (road s11 s10)
    (road s12 s13) (road s13 s12)
    (road s12 s14) (road s14 s12)
    (road s14 s15) (road s15 s14)
    (road s13 s16) (road s16 s13)
    (road s16 s17) (road s17 s16)
    (road s15 s17) (road s17 s15)
    (road s15 s18) (road s18 s15)
    
    ; Blue line subway construction
    (blue s8) (blue s9) (blue s11)
    (blue s13) (blue s7) (blue s5)
    
    ; Red line subway construction
    (red s4) (red s20) (red s18)
    (red s15) (red s12)
    
    ; Station construction
    (station s9) (station s11) (station s13)
    (station s7) (station s5) (station s4)
    (station s18) (station s15)
    
    ; Mailman position
    (at mailman1 s1)
    (at mailman2 s17)
    
    ; House position
    (has_house s10 house1)
    (has_house s11 house2)
    (has_house s6 house3)
    (has_house s14 house4)
    (has_house s18 house5)
    (has_house s16 house6)
    (has_house s20 house7)
    
    ; Letter position
    (has_letter house1 letter1)
    (has_letter house3 letter2)
    (has_letter house4 letter3)
    (has_letter house6 letter4)
    (has_letter house7 letter5)
    
    ; Box position
    (has_box s4 box1)
    (has_box s12 box2)

  )

  (:goal (and
    ; All letters are in a box
    (sent letter1)
    (sent letter2)
    (sent letter3)
    (sent letter4)
    (sent letter5)
  ))
)