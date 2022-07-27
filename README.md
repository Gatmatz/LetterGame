FIELD ANALYSIS

The entities of this particular problem family are:
1. Courier
2. Spot
3. Mailboxes (Box)
4. Letters
5. Houses


The relationships between the entities of the particular problem family are

1. has_house(Point, House)

    The specific relationship states that there is a house at the specific point.


2. has_box(Point, Box)

    The specific relationship states that there is a post office box at the specific point.


3. has_letter(House, Letter)

    The specific relationship states that in the specific house there is a specific letter.


4. at(Post, Point)

    The specific relationship states that a specific Postman is at a specific point.


5. blue_subway(Postman)

   This particular relationship states that the postman is on the blue subway line.


6. red_subway(Postman)

    This particular relationship states that the postman is on the red subway line.


7. blue(Point, Point)

   This relationship states that there is a blue subway line route from one specific point to another.


8. red(Point, Point)

    This relationship states that there is a red subway line route from one specific point to another.

9. station

   The specific relationship states that the specific point is a subway stop.

10. road(Point, Point)

    The concrete relation states that there is a path from one particular point to another.

11. carries(Postman, Letter)

    The particular relationship states that the particular postman carries the particular letter in his bag.

12. sent(Letter)

    The specific relationship states that the specific letter has been sent (it is in a mailbox).

13. courier(x)

    This relation states that an object x is a postman.

14. spot(x)

    This relation states that an object x is a point.

15. box(x)

    This relation states that an object x is a mailbox.

16. house(x)

    This relation states that an object x is a house.

17. letter(x)

    This relation states that an object x is a letter.



Transition Operators

The transition operators of this family of problems are:

1. Move Name: Move

      Parameters: Postman agent, Point from, Point to

       Conditions:
      • courier (agent)

      • spot(from)
      • spot(to)

      • at(agent, from)

      • road(from, to)

      • not (= from to)

      • not(blue_subway, agent)

      • not(red_subway, agent)

      Add List:

      • at(agent, to)

      Delete list:

      • at(agent, from)

      Operator Description

      This operator transports a postman from one point to another via a road.


2. Transition Name: enter_blue

      Parameters: Postman agent, Point station1

      Conditions:

      • courier (agent)

      • spot(station1)

      • at(agent, station1)

      • station(station1)

      • not(blue_subway, agent)

      • not(red_subway, agent)

      Add List:

      • blue_subway(agent)

      Delete list:


      Operator Description

      This operator is boarding a postman inside the blue subway line. Condition that the postman is not inside a subway line and is at a stop.

3. Transition Name: enter_red

      Parameters: Postman agent, Point station1

      Conditions:

      • courier (agent)

      • spot(station1)

      • at(agent, station1)

      • station(station1)

      • not(blue_subway, agent)

      • not(red_subway, agent)

      Add List:

      • red_subway(agent)

      Delete list:

      Operator Description: This operator inserts a postman into the red subway line. Condition that the postman is not inside a subway line and is at a stop.


4. Transition Name: leave_blue

      Parameters: Postman agent, Point station1

      Conditions:

      • courier (agent)

      • spot(station1)

      • at(agent, station1)

      • station(station1)

      • blue_subway(agent)

      Add List:

      Delete list:

      • blue_subway(agent)

      Operator Description: This operator drops off a postman from the blue subway line. Condition for the postman to be inside the blue metro line and to be at a stop.


5. Transition Name: leave_red

      Parameters: Postman agent, Point station1

      Conditions:

      • courier (agent)

      • spot(station1)

      • at(agent, station1)

      • station(station1)

      • red_subway(agent)

      Add List:

      Delete list:

      • red_subway(agent)

      Operator Description: This operator drops off a postman from the red subway line. Condition for the postman to be inside the red metro line and to be at a stop.


6. Move Name: move_blue

      Parameters: Postman agent, Point from, Point to

      Conditions:

      • courier (agent)

      spot(from)

      • spot(to)

      • at(agent, from)

      • blue_subway(agent)

      • blue(from, to)

      • not (= from to)

      Add List:

      • at(agent, to)

      Delete list:

      • at(agent, from)

      Operator Description: This operator transports a postman from one point to another via the blue subway line. Condition that both points are on the blue line of the metro and the postman is on the blue line.
      
      
7. Move Name: move_red

    Parameters: Postman agent, Point from, Point to

    Conditions:

    • courier (agent)

    • spot(from)

    • spot(to)

    • at(agent, from)

    • red_subway(agent)

    • red(from, to)

    • not (= from to)

    Add List:

    • at(agent, to)

    Delete list:

    • at(agent, from)

    Operator Description: This operator transports a postman from one point to another through the red subway line. Condition that both points are on the red line of the metro and the postman is on the red line.


8. Jump Name: pick_letter

    Parameters: Postman agent, Point spot1, House house1, Letter letter1

    Conditions:

    • courier (agent)

    • spot(spot1)

    • house(house1)

    letter(letter1)

    • at(agent, spot1)

    • has_house(spot1, house1)

    • has_letter(house1, letter1)

    • not(blue_subway, agent)

    • not(red_subway, agent)

    Add List:

    • carries(agent, letter1)

    Delete list:

    • has_letter(house1, letter1)

    Operator Description: This operator takes a letter from a house and places it in the postman's bag.


9. Jump Name: drop_letter

    Parameters: Postman agent, Spot spot1, Mailbox box1, Letter letter1

    Conditions:

    • courier (agent)

    • spot(spot1)

    • box(box1)

    letter(letter1)

    • at(agent, spot1)

    • has_box(spot1, box1)

    • carries(agent, letter1)

    • not(blue_subway, agent)

    • not(red_subway, agent)

    Add List:

    • sent(letter1)

    Delete list:

    • carries(agent, letter1)

    Operator description: This operator sends a letter, i.e. leaves a letter from the postman's bag and places it in a mailbox.
