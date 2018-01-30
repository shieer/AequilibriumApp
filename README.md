# AequilibriumApp

This project is for demonstrating the Aequilibrium Assignments:

#### Part 1: The Castle Company

This part includes simple UI to generate a random land with a maximum size 20, each height is maximum 5

* Because the castleAnalyzer function not only calculate the num of castles, it also shows what Peaks are , what Valleys are. So I in this part I made an extra assumption:
##### If land is [2,2,2,2], I assumed this is valley

###### Test cases:
1. [1,2,3,4,4,4,4,4,2,2,2,1]
2. [1,1,1,1,1,1]
3. [2,4,4,4,4,2]
4. [3,3,4,4,3,1,3,1,2,2]
5. [3,3,3,1]
6. [3,3]
7. [3]

#### Part 2: The Transformation Company

This part contains

###### Test cases:
1. - Soundwave:D,8,9,2,6,9,5,6,10
   - Bluestreak:A,6,6,7,9,5,2,9,7
   - Hubcap:A,4,4,4,4,4,4,4,4
2. - Soundwave:D,8,9,2,6,7,5,6,10
   - Bluestreak:A,6,6,7,9,5,2,9,7
   - Hubcap:A,4,4,4,4,4,4,4,4
3. - Soundwave:D,8,9,2,6,7,5,6,10
   - Soundwave:A,8,9,2,6,7,5,6,10
   - Hubcap:A,4,4,4,4,4,4,4,4
4. - Predaking:D,8,9,2,6,7,5,6,10
   - Soundwave:A,8,9,2,6,7,5,6,10
   - Hubcap:A,4,4,4,4,4,4,4,4

###### Input Parse Error Handler:
* formatNotMatch: when input not match "String:Char,(1-10),(1-10),(1-10),(1-10),(1-10),(1-10),(1-10),(1-10)"
* teamNotMatch: team neither D nor A
* criteriaTypeError: criteria is not integer
* criteriaRangeError: criteria is not between 1 to 10
