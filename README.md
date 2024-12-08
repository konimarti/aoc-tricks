# Advent of Code -- Useful Algorithms and Tricks

## Tricks

### 2D-Grid with Complex numbers

A 2D grid can be stored in with a complex numbers, `z = a + bi`,
where the real part a would represent the `x` and `b` the `y` coordinates
respectively.

Advantage of this approach is that `x`,`y` are represented by one unit.
A rotation of the direction is easy: it's just a multiplication with the
imaginary unit `i` (opposite direction with `-i`).

For example, the complex number `z = a + bi` can be rotated by 90°
clockwise by multiplying it with i: `z * i = -b + ai`.


## Data Structures

### Heap

A heap is binary tree (careful: it is not a binary search tree!).
A heap must be _complete_ and fulfill the _heap property_.

A heap is complete, when all nodes on all levels are filled (except for the last row).

The heap property dictates that the parent node must be larger (or
smaller in case of min-heap) then its two children nodes. Heaps are thus
often used to implement _priority queues_.

For this reason, a heap is not practical for searching nodes; you would
need to visit all nodes which scales as O(N). A binary search tree just
requires O(log N) steps.

However, a heap has efficient insertions and deletions operations that
scale as O(log N). The largest value (or smaller for min-heaps) are
always in the root node.

For insertions and deletions, we need to now the last node in the heap.
We can simplify this problem by representing a heap as an array. In such
an array, index 0 would represent the root node and the last element in
the array is the last node in the heap.

[heap data structure](https://www.geeksforgeeks.org/heap-data-structure/)

[heap introduction](https://www.geeksforgeeks.org/introduction-to-heap/)

## Algorithms

### Breath First Search (BFS)

Underlying data structure is a *FIFO queue*. Pop an element off, process
it, append new results to the queue, then repeat.

_Initialization:_ Enqueue the given source vertex into a queue and mark it as visited.

1. _Exploration:_ While the queue is not empty:

    - Dequeue a node from the queue and visit it (e.g., print its value).

    - For each unvisited neighbor of the dequeued node:

        - Enqueue the neighbor into the queue.

        - Mark the neighbor as visited. 

2. _Termination:_ Repeat step 2 until the queue is empty. 

[bfs](https://www.geeksforgeeks.org/breadth-first-search-or-bfs-for-a-graph/)


### Depth First Search (DFS)

Underlying data structure is a *stack*. The stack can also be the
callstack of recursive functions.

When we traverse an adjacent vertex, we completely finish the traversal
of all vertices reachable through that adjacent vertex. After we finish
traversing one adjacent vertex and its reachable vertices, we move to
the next adjacent vertex and repeat the process.

[dfs](https://www.geeksforgeeks.org/depth-first-search-or-dfs-for-a-graph/)


### Dijkstra

Find shortest path from source to all vertices.

[dijkstra](https://www.geeksforgeeks.org/dijkstras-shortest-path-algorithm-greedy-algo-7/)

[code in c](dijkstra.c)

[cod in c3](dijkstra.c3)

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
