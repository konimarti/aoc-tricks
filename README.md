# Advent of Code -- Useful Algorithms and Tricks

## Algorithms

### Breath First Search (BFS)

[bfs](https://www.geeksforgeeks.org/breadth-first-search-or-bfs-for-a-graph/)


### Depth First Search (DFS)

[dfs](https://www.geeksforgeeks.org/depth-first-search-or-dfs-for-a-graph/)


### Dijkstra

Find shortest path from source to all vertices.

[dijkstra](https://www.geeksforgeeks.org/dijkstras-shortest-path-algorithm-greedy-algo-7/)

[dijkstra in c](dijkstra.c)
[dijkstra in c3](dijkstra.c3)

### Even-Odd rule / Non-Zero rule

A ray from a point P heading out of the curve: In the even–odd case, the
ray is intersected by two lines, an even number; therefore P is
concluded to be 'outside' the curve. By the non-zero winding rule, the
ray is intersected in a clockwise direction twice, each contributing −1
to the winding score: because the total, −2, is not zero, P is concluded
to be 'inside' the curve.

[oddrule](https://en.wikipedia.org/wiki/Even%E2%80%93odd_rule)


### Pick's theorem

A formula for the area A of a simple polygon with integer vertex
coordinates.

```
A = i + b / 2 - 1
```

`i` is the number of vertices inside the polygon, `b` the number of
vertices on the boundary.

[picks](https://en.wikipedia.org/wiki/Pick%27s_theorem)


### Shoelace

Algorithm to determine the area A of a simple polygon:

```
2 * A = det(pos_1, pos_2) + det(pos_i, pos_i+1) + det(pos_n + pos_1)
```

[shoelace](https://en.wikipedia.org/wiki/Shoelace_formula)


## Other resources

[Tricks by Erikw](https://erikw.netlify.app/blog/tech/advent-of-code-tricks/)
