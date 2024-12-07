module dijkstra;

import std::io;
import std::collections::list;

def Graph = List(<int[]>);

fn void main() 
{
	// @pool()
	{
		List(<int[]>) graph; 
		graph.temp_init();
		graph.push({0, 4, 0, 0, 0, 0, 0, 8, 0});
		graph.push({4, 0, 8, 0, 0, 0, 0, 11,0});
		graph.push({0, 8, 0, 7, 0, 4, 0, 0, 2});
		graph.push({0, 0, 7, 0, 9, 14,0, 0, 0});
		graph.push({0, 0, 0, 9, 0, 10,0, 0, 0});
		graph.push({0, 0, 4, 14,10,0, 2, 0, 0});
		graph.push({0, 0, 0, 0, 0, 2, 0, 1, 6});
		graph.push({8, 11,0, 0, 0, 0, 1, 0, 7});
		graph.push({0, 0, 2, 0, 0, 0, 6, 7, 0});
		// io::printn(dijkstra_temp(graph, 0)!!);
		int[] dist = dijkstra_new(graph, 0)!!;
		io::printn(dist);
		defer free(dist);
	};
}

fn int[]! dijkstra_new(Graph graph, int src)
{
	int[] dist = mem::alloc_array(int, graph.len());
	dijkstra_buffer(graph, src, dist)!;
	return dist;
}

fn int[]! dijkstra_temp(Graph graph, int src)
{
	int[] dist = mem::temp_alloc_array(int, graph.len());
	dijkstra_buffer(graph, src, dist)!;
	return dist;
}

<*
@param [inout] dist "Shortest distances from source"
@require graph.len() > 0 "Graph cannot be empty"
@require graph.len() == graph[0].len "Graph must be symmetrical"
*>
fn void! dijkstra_buffer(Graph graph, int src, int[] dist)
{
	usz n = graph.len();

	@pool()
	{
		bool[] sptSet = mem::temp_alloc_array(bool, n);

		foreach (&d : dist) *d = int.max;
		foreach (&b : sptSet) *b = false;

		dist[src] = 0;

		usz count = n - 1;
		while (count--)
		{
			int u = min_distance(dist, sptSet);
			sptSet[u] = true;

			for (int v = 0; v < n; v++)
			{
				if (!sptSet[v] && graph[u][v] && dist[u] != int.max && dist[u] + graph[u][v] < dist[v])
				{
					dist[v] = dist[u] + graph[u][v];
				}
			}
		}
	};
}

<*
@require dist.len == sptSet.len
*>
fn int min_distance(int[] dist, bool[] sptSet)
{
	int min = int.max;
	int min_index;
	for (int v = 0; v < dist.len; v++)
	{
		if (sptSet[v] == false && dist[v] <= min)
		{
			min = dist[v];
			min_index = v;
		}
	}
	return min_index;
}
