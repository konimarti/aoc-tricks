# Advent of Code -- Useful Algorithms and Tricks

## Tricks

### Cramer's rule: Solve linear equations

Solve a system of linear equations with as many equations as unknowns.

Consider `Ax = b` where `A` is a (nxn)-matrix, `x` and `b` are (nx1)-vectors.
Then, in the case the system has an unique solution, the unknown *x_i* are
given by:
```
x_i = det(A_i) / det(A)
```
where `A_i` is the matrix formed by replacing the _i_-th column of `A` by the
column of vector `b`.

[cramers rule](https://en.wikipedia.org/wiki/Cramer%27s_rule)

### Counting sides of a rectilinear polygon

If we need to number of sides of a rectilinear polygon (a polygon with only
90° angles), then we can also just count _the number of corners_.

### 2D-Grid with Complex numbers

A 2D grid can represented with complex numbers, `z = a + bi`,
where the real part `a` would encode the `x` coordinate and the
imaginary part `b` the `y` coordinate, respectively.

The advantage of this approach is that the two coordinates `(x,y)` are
stored in one unit.

A 90° rotation of the direction is easy: just multiply a complex number that
represents the direction with the imaginary unit `i` for a clockwise rotation
(counter-clockwise with `-i`).

For example, a direction represented by the complex number `z = a + bi` can be
rotated by 90° clockwise by multiplying it with `i`: `z * i = -b + ai`.

### Least Common Multiples (LCM) to synchronize different cycles

To find a common point in time or space where two or more cycles are
synchronized, we calculate the LCM of their cycle times.

The LCM can be calculated from the greatest common divisor (GCD) as follows:

`LCM(a,b) = (a * b) / GCD(a,b)`

with

```c
// Recursive function to return gcd of a and b 
int gcd(int a, int b) 
{ 
    if (a == 0)
        return b; 
    return gcd(b % a, a); 
} 

// Function to return LCM of two numbers 
int lcm(int a, int b) 
{ 
    return (a / gcd(a, b)) * b;
} 
```

## Data Structures

### Heap

A heap is binary tree which is _complete_ and fulfills the _heap property_:

 * A heap is _complete_, when all nodes on all levels are filled (except for the last row).

 * The _heap property_ dictates that the parent node must be larger (or
    smaller in case of min-heaps) than its children nodes.

A heap is not practical for searching nodes since it is only _weakly
ordered_; you would need to visit all nodes which scales as O(N). A binary
search tree would be more efficient for this by requiring only O(log N) steps.

However, a heap has efficient insertion and deletion operations which both
scale as O(log N). The largest value (or smaller for min-heaps) are always in
the root node. Hence, heaps are often used to implement _priority queues_.

For insertions and deletions, we need to know the last node in the heap.  We
can avoid this problem by representing a heap in an array. In an array, index
0 would represent the root node and the last array element would be the last
node in the heap.

[heap data structure](https://www.geeksforgeeks.org/heap-data-structure/)

[heap introduction](https://www.geeksforgeeks.org/introduction-to-heap/)

Note: the heap is not to be confused with a binary search tree. In a binary
search tree, the left node is always smaller and the right node is larger than
the parent node.

## Algorithms

### Breath First Search (BFS)

A tree-traversel method that explores all the options. Useful to find the
shortest path, i.e. a global optimum.

Underlying data structure is a *FIFO queue*. Pop an element off, process
it, append new results to the queue, then repeat 

_Initialization:_ Enqueue the given source vertex into a queue and mark it as visited.

1. _Exploration:_ While the queue is not empty:

    - Dequeue a node from the queue and visit it (e.g., print its value).

    - For each unvisited neighbor of the dequeued node:

        - Enqueue the neighbor into the queue.

        - Mark the neighbor as visited. 

2. _Termination:_ Repeat step 2 until the queue is empty. 

[bfs](https://www.geeksforgeeks.org/breadth-first-search-or-bfs-for-a-graph/)

### Depth First Search (DFS)

Another tree-traversal method that explores the deepest branches first. Useful
for finding solutions to a mace.

Underlying data structure is a *stack*. The stack can also be a local variable
on the callstack of recursive functions.

When we traverse an adjacent vertex, we completely finish the traversal
of all vertices reachable through that adjacent vertex. After we finish
traversing one adjacent vertex and its reachable vertices, we move to
the next adjacent vertex and repeat the process.

[dfs](https://www.geeksforgeeks.org/depth-first-search-or-dfs-for-a-graph/)

### Topological Sorting

Aligns the vertices in a DAC (directed-acyclical) graph into a linear order.
It can be done using a DFS approach: Starting vertex is processed, i.e. all its
adjacent vertices are visited, and afterwards pushed on the stack. Repeat this
until all vertices have been visited. Then the vertices can be popped off the
stack in a topological sorting order.

[topological sorting](https://www.geeksforgeeks.org/topological-sorting/)

### Memoization

Technique to improve performance of recursive algorithms. Store (intermediate)
results of subproblems that can be reused.

This can usually be done for recursive algorithms that descends down into trees
or other structures. The intermediate result are usually stored in a hash
table.

[memoization](https://www.geeksforgeeks.org/what-is-memoization-a-complete-tutorial/)

An alternative dynamic programming technique is `tabulation` as it is used in
the Knapsack, Largest Subsequences, etc.

[memo vs. tables](https://www.geeksforgeeks.org/tabulation-vs-memoization/)

### Dijkstra

Find shortest path from source to all vertices.

[dijkstra](https://www.geeksforgeeks.org/dijkstras-shortest-path-algorithm-greedy-algo-7/)

[code in c](dijkstra.c)

[code in c3](dijkstra.c3)

### Knapsack

Solve a combinatorial optimization problem: maximize value for a given
constraint.

[knapsack](https://www.geeksforgeeks.org/0-1-knapsack-problem-dp-10/)

[youtube](https://www.youtube.com/watch?v=cJ21moQpofY)

[youtube code in c3](knapsack.c3)

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


## Further Readings

* [Tricks by Erikw](https://erikw.netlify.app/blog/tech/advent-of-code-tricks/)

* [Algorithm repository by williamfiset](https://github.com/williamfiset/algorithms)

* [Modulo arithmetic](https://brilliant.org/wiki/modular-arithmetic/)
