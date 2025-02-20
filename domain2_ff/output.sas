begin_version
3
end_version
begin_metric
0
end_metric
36
begin_variable
var0
-1
2
Atom at(drone_support, area9)
NegatedAtom at(drone_support, area9)
end_variable
begin_variable
var1
-1
2
Atom at(drone_support, area1)
NegatedAtom at(drone_support, area1)
end_variable
begin_variable
var2
-1
2
Atom at(drone_support, area2)
NegatedAtom at(drone_support, area2)
end_variable
begin_variable
var3
-1
2
Atom at(drone_support, area3)
NegatedAtom at(drone_support, area3)
end_variable
begin_variable
var4
-1
2
Atom at(drone_support, area4)
NegatedAtom at(drone_support, area4)
end_variable
begin_variable
var5
-1
2
Atom at(drone_support, area6)
NegatedAtom at(drone_support, area6)
end_variable
begin_variable
var6
-1
2
Atom at(drone_support, area7)
NegatedAtom at(drone_support, area7)
end_variable
begin_variable
var7
-1
2
Atom at(drone_support, area8)
NegatedAtom at(drone_support, area8)
end_variable
begin_variable
var8
-1
2
Atom at(drone1, area1)
NegatedAtom at(drone1, area1)
end_variable
begin_variable
var9
-1
2
Atom at(drone1, area3)
NegatedAtom at(drone1, area3)
end_variable
begin_variable
var10
-1
2
Atom at(drone1, area7)
NegatedAtom at(drone1, area7)
end_variable
begin_variable
var11
-1
2
Atom at(drone1, area9)
NegatedAtom at(drone1, area9)
end_variable
begin_variable
var12
-1
2
Atom at(drone2, area1)
NegatedAtom at(drone2, area1)
end_variable
begin_variable
var13
-1
2
Atom at(drone2, area3)
NegatedAtom at(drone2, area3)
end_variable
begin_variable
var14
-1
2
Atom at(drone2, area7)
NegatedAtom at(drone2, area7)
end_variable
begin_variable
var15
-1
2
Atom at(drone2, area9)
NegatedAtom at(drone2, area9)
end_variable
begin_variable
var16
-1
2
Atom at(drone1, area2)
NegatedAtom at(drone1, area2)
end_variable
begin_variable
var17
-1
2
Atom at(drone1, area4)
NegatedAtom at(drone1, area4)
end_variable
begin_variable
var18
-1
2
Atom hasenergyhigh(drone1)
NegatedAtom hasenergyhigh(drone1)
end_variable
begin_variable
var19
-1
2
Atom at(drone1, area6)
NegatedAtom at(drone1, area6)
end_variable
begin_variable
var20
-1
2
Atom at(drone1, area8)
NegatedAtom at(drone1, area8)
end_variable
begin_variable
var21
-1
2
Atom at(drone1, area5)
NegatedAtom at(drone1, area5)
end_variable
begin_variable
var22
-1
2
Atom hasenergylow(drone1)
NegatedAtom hasenergylow(drone1)
end_variable
begin_variable
var23
-1
2
Atom at(drone2, area2)
NegatedAtom at(drone2, area2)
end_variable
begin_variable
var24
-1
2
Atom at(drone2, area4)
NegatedAtom at(drone2, area4)
end_variable
begin_variable
var25
-1
2
Atom hasenergyhigh(drone2)
NegatedAtom hasenergyhigh(drone2)
end_variable
begin_variable
var26
-1
2
Atom at(drone2, area6)
NegatedAtom at(drone2, area6)
end_variable
begin_variable
var27
-1
2
Atom at(drone2, area8)
NegatedAtom at(drone2, area8)
end_variable
begin_variable
var28
-1
2
Atom at(drone2, area5)
NegatedAtom at(drone2, area5)
end_variable
begin_variable
var29
-1
2
Atom hasenergylow(drone2)
NegatedAtom hasenergylow(drone2)
end_variable
begin_variable
var30
-1
2
Atom datacollected(area1, temp)
NegatedAtom datacollected(area1, temp)
end_variable
begin_variable
var31
-1
2
Atom datacollected(area2, temp)
NegatedAtom datacollected(area2, temp)
end_variable
begin_variable
var32
-1
2
Atom datacollected(area3, temp)
NegatedAtom datacollected(area3, temp)
end_variable
begin_variable
var33
-1
2
Atom datacollected(area1, hum)
NegatedAtom datacollected(area1, hum)
end_variable
begin_variable
var34
-1
2
Atom datacollected(area2, hum)
NegatedAtom datacollected(area2, hum)
end_variable
begin_variable
var35
-1
2
Atom datacollected(area3, hum)
NegatedAtom datacollected(area3, hum)
end_variable
0
begin_state
1
1
1
1
1
1
1
1
1
0
1
1
1
1
1
0
1
1
0
1
1
1
1
1
1
0
1
1
1
1
1
1
1
1
1
1
end_state
begin_goal
6
30 0
31 0
32 0
33 0
34 0
35 0
end_goal
136
begin_operator
collectdata drone1 area1 temp
1
8 0
1
0 30 1 0
1
end_operator
begin_operator
collectdata drone1 area2 temp
1
16 0
1
0 31 1 0
1
end_operator
begin_operator
collectdata drone1 area3 temp
1
9 0
1
0 32 1 0
1
end_operator
begin_operator
collectdata drone2 area1 hum
1
12 0
1
0 33 1 0
1
end_operator
begin_operator
collectdata drone2 area2 hum
1
23 0
1
0 34 1 0
1
end_operator
begin_operator
collectdata drone2 area3 hum
1
13 0
1
0 35 1 0
1
end_operator
begin_operator
movehighenergy drone1 area1 area2
0
4
0 8 0 1
0 16 -1 0
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area1 area4
0
4
0 8 0 1
0 17 -1 0
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area2 area1
0
4
0 8 -1 0
0 16 0 1
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area2 area3
0
4
0 16 0 1
0 9 -1 0
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area2 area5
0
4
0 16 0 1
0 21 -1 0
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area3 area2
0
4
0 16 -1 0
0 9 0 1
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area3 area6
0
4
0 9 0 1
0 19 -1 0
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area4 area1
0
4
0 8 -1 0
0 17 0 1
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area4 area5
0
4
0 17 0 1
0 21 -1 0
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area4 area7
0
4
0 17 0 1
0 10 -1 0
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area5 area2
0
4
0 16 -1 0
0 21 0 1
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area5 area4
0
4
0 17 -1 0
0 21 0 1
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area5 area6
0
4
0 21 0 1
0 19 -1 0
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area5 area8
0
4
0 21 0 1
0 20 -1 0
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area6 area3
0
4
0 9 -1 0
0 19 0 1
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area6 area5
0
4
0 21 -1 0
0 19 0 1
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area6 area9
0
4
0 19 0 1
0 11 -1 0
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area7 area4
0
4
0 17 -1 0
0 10 0 1
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area7 area8
0
4
0 10 0 1
0 20 -1 0
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area8 area5
0
4
0 21 -1 0
0 20 0 1
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area8 area7
0
4
0 10 -1 0
0 20 0 1
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area8 area9
0
4
0 20 0 1
0 11 -1 0
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area9 area6
0
4
0 19 -1 0
0 11 0 1
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone1 area9 area8
0
4
0 20 -1 0
0 11 0 1
0 18 0 1
0 22 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area1 area2
0
4
0 12 0 1
0 23 -1 0
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area1 area4
0
4
0 12 0 1
0 24 -1 0
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area2 area1
0
4
0 12 -1 0
0 23 0 1
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area2 area3
0
4
0 23 0 1
0 13 -1 0
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area2 area5
0
4
0 23 0 1
0 28 -1 0
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area3 area2
0
4
0 23 -1 0
0 13 0 1
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area3 area6
0
4
0 13 0 1
0 26 -1 0
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area4 area1
0
4
0 12 -1 0
0 24 0 1
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area4 area5
0
4
0 24 0 1
0 28 -1 0
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area4 area7
0
4
0 24 0 1
0 14 -1 0
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area5 area2
0
4
0 23 -1 0
0 28 0 1
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area5 area4
0
4
0 24 -1 0
0 28 0 1
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area5 area6
0
4
0 28 0 1
0 26 -1 0
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area5 area8
0
4
0 28 0 1
0 27 -1 0
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area6 area3
0
4
0 13 -1 0
0 26 0 1
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area6 area5
0
4
0 28 -1 0
0 26 0 1
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area6 area9
0
4
0 26 0 1
0 15 -1 0
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area7 area4
0
4
0 24 -1 0
0 14 0 1
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area7 area8
0
4
0 14 0 1
0 27 -1 0
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area8 area5
0
4
0 28 -1 0
0 27 0 1
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area8 area7
0
4
0 14 -1 0
0 27 0 1
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area8 area9
0
4
0 27 0 1
0 15 -1 0
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area9 area6
0
4
0 26 -1 0
0 15 0 1
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movehighenergy drone2 area9 area8
0
4
0 27 -1 0
0 15 0 1
0 25 0 1
0 29 -1 0
1
end_operator
begin_operator
movelowenergy drone1 area1 area2
0
3
0 8 0 1
0 16 -1 0
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area1 area4
0
3
0 8 0 1
0 17 -1 0
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area2 area1
0
3
0 8 -1 0
0 16 0 1
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area2 area3
0
3
0 16 0 1
0 9 -1 0
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area2 area5
0
3
0 16 0 1
0 21 -1 0
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area3 area2
0
3
0 16 -1 0
0 9 0 1
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area3 area6
0
3
0 9 0 1
0 19 -1 0
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area4 area1
0
3
0 8 -1 0
0 17 0 1
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area4 area5
0
3
0 17 0 1
0 21 -1 0
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area4 area7
0
3
0 17 0 1
0 10 -1 0
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area5 area2
0
3
0 16 -1 0
0 21 0 1
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area5 area4
0
3
0 17 -1 0
0 21 0 1
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area5 area6
0
3
0 21 0 1
0 19 -1 0
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area5 area8
0
3
0 21 0 1
0 20 -1 0
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area6 area3
0
3
0 9 -1 0
0 19 0 1
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area6 area5
0
3
0 21 -1 0
0 19 0 1
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area6 area9
0
3
0 19 0 1
0 11 -1 0
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area7 area4
0
3
0 17 -1 0
0 10 0 1
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area7 area8
0
3
0 10 0 1
0 20 -1 0
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area8 area5
0
3
0 21 -1 0
0 20 0 1
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area8 area7
0
3
0 10 -1 0
0 20 0 1
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area8 area9
0
3
0 20 0 1
0 11 -1 0
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area9 area6
0
3
0 19 -1 0
0 11 0 1
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone1 area9 area8
0
3
0 20 -1 0
0 11 0 1
0 22 0 1
1
end_operator
begin_operator
movelowenergy drone2 area1 area2
0
3
0 12 0 1
0 23 -1 0
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area1 area4
0
3
0 12 0 1
0 24 -1 0
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area2 area1
0
3
0 12 -1 0
0 23 0 1
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area2 area3
0
3
0 23 0 1
0 13 -1 0
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area2 area5
0
3
0 23 0 1
0 28 -1 0
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area3 area2
0
3
0 23 -1 0
0 13 0 1
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area3 area6
0
3
0 13 0 1
0 26 -1 0
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area4 area1
0
3
0 12 -1 0
0 24 0 1
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area4 area5
0
3
0 24 0 1
0 28 -1 0
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area4 area7
0
3
0 24 0 1
0 14 -1 0
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area5 area2
0
3
0 23 -1 0
0 28 0 1
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area5 area4
0
3
0 24 -1 0
0 28 0 1
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area5 area6
0
3
0 28 0 1
0 26 -1 0
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area5 area8
0
3
0 28 0 1
0 27 -1 0
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area6 area3
0
3
0 13 -1 0
0 26 0 1
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area6 area5
0
3
0 28 -1 0
0 26 0 1
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area6 area9
0
3
0 26 0 1
0 15 -1 0
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area7 area4
0
3
0 24 -1 0
0 14 0 1
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area7 area8
0
3
0 14 0 1
0 27 -1 0
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area8 area5
0
3
0 28 -1 0
0 27 0 1
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area8 area7
0
3
0 14 -1 0
0 27 0 1
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area8 area9
0
3
0 27 0 1
0 15 -1 0
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area9 area6
0
3
0 26 -1 0
0 15 0 1
0 29 0 1
1
end_operator
begin_operator
movelowenergy drone2 area9 area8
0
3
0 27 -1 0
0 15 0 1
0 29 0 1
1
end_operator
begin_operator
movesupportdrone drone_support area1
2
8 0
22 0
1
0 1 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area1
2
12 0
29 0
1
0 1 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area2
2
16 0
22 0
1
0 2 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area2
2
23 0
29 0
1
0 2 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area3
2
9 0
22 0
1
0 3 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area3
2
13 0
29 0
1
0 3 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area4
2
17 0
22 0
1
0 4 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area4
2
24 0
29 0
1
0 4 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area6
2
19 0
22 0
1
0 5 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area6
2
26 0
29 0
1
0 5 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area7
2
10 0
22 0
1
0 6 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area7
2
14 0
29 0
1
0 6 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area8
2
20 0
22 0
1
0 7 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area8
2
27 0
29 0
1
0 7 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area9
2
11 0
22 0
1
0 0 -1 0
1
end_operator
begin_operator
movesupportdrone drone_support area9
2
15 0
29 0
1
0 0 -1 0
1
end_operator
begin_operator
rechargedrone drone_support drone1 area1
2
8 0
1 0
1
0 18 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone1 area2
2
16 0
2 0
1
0 18 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone1 area3
2
9 0
3 0
1
0 18 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone1 area4
2
17 0
4 0
1
0 18 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone1 area5
1
21 0
1
0 18 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone1 area6
2
19 0
5 0
1
0 18 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone1 area7
2
10 0
6 0
1
0 18 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone1 area8
2
20 0
7 0
1
0 18 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone1 area9
2
11 0
0 0
1
0 18 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone2 area1
2
12 0
1 0
1
0 25 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone2 area2
2
23 0
2 0
1
0 25 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone2 area3
2
13 0
3 0
1
0 25 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone2 area4
2
24 0
4 0
1
0 25 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone2 area5
1
28 0
1
0 25 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone2 area6
2
26 0
5 0
1
0 25 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone2 area7
2
14 0
6 0
1
0 25 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone2 area8
2
27 0
7 0
1
0 25 1 0
1
end_operator
begin_operator
rechargedrone drone_support drone2 area9
2
15 0
0 0
1
0 25 1 0
1
end_operator
0
