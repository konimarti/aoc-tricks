module knapsack;

import std::io;
import std::collections::list;

struct Item
{
	long value;
	long weight;
}

fn usz! Item.to_format(&self, Formatter *f) @dynamic
{
	return f.printf("(value: %d, weight: %d)", self.value, self.weight);
}

fn void main() 
{
	@pool()
	{
		List(<Item>) items; 
		items.temp_init_with_array({{2,3},{2,1},{4,3},{5,4},{3,2}});

		List(<Item>) inside = knapsack(items, 7)!!;
		io::printn(inside);
	};
}

fn List(<Item>)! knapsack(List(<Item>) items, long capacity)
{
	List(<long[]>) dp;
	dp.temp_init();
	for (usz i = 0; i < items.len() + 1; ++i)
	{
		dp.push(mem::temp_new_array(long, capacity + 1));
	}

	// fill up dynamic programming table dp with the rules:
	// if we don't add it, use value directly above
	// if we add it, check if added value + dp[i-1][j-w] > dp[i-1][j]
	foreach (i, line : dp)
	{
		if (i == 0) continue;
		foreach (j, &value : line)
		{
			usz v = items[i - 1].value;
			usz w = items[i - 1].weight;
			if (j < w)
			{
				*value = dp[i - 1][j];
			}
			else
			{
				if (v + dp[i - 1][j - w] <= dp[i - 1][j])
				{
					*value = dp[i - 1][j];
				}
				else
				{
					*value = v + dp[i - 1][j - w];
				}
			}
		}
		
	}

	// find largest element in table
	// (this loop can be integrated into dp table construction)
	usz xpos = usz.min;
	usz ypos = usz.min;
	usz max = usz.min;
	foreach (x, line : dp)
	{
		foreach (y, v : line)
		{
			if (v > max)
			{
				xpos = x;
				ypos = y;
				max = v;
			}
		}
	}

	// print table just for fun and debug
	$if $feature(DEBUG):
	foreach (line : dp)
	{
		io::printn(line);
	}
	io::printfn("max element: %d, %d with %d", xpos, ypos, max);
	$endif

	List(<Item>) selected;
	selected.temp_init();

	// backtrack from that element to collect any selected items.
	// Start from highest value in dynamic programming table.
	// If value from next item at same capacity is the same, don't add
	// this item and move one line up. Otherwise add item, and move 1 line
	// up, minus the weight of the added item.
	while LOOP: (xpos >= 1)
	{
		Item current = items[xpos - 1];

		if (dp[xpos][ypos] == dp[xpos - 1][ypos])
		{
			// do not add current item to knapsack
			// move one line up
			xpos--;
		}
		else
		{
			// add item, move one line up
			selected.push(current);
			ypos = ypos - current.weight;
			xpos--;
		}
	}

	return selected;
}
