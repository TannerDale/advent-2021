int Part1(string[] arr)
{
  int count = 0;
  for (int i = 0; i < arr.Length; i++)
  {
    if (i != 0)
    {
      if (Int32.Parse(arr[i]) > Int32.Parse(arr[i - 1]))
      {
        count += 1;
      }
    }
  }
  return count;
}

string[] pracInput = new string[] { "199", "200", "208", "210", "200", "207", "240", "269", "260", "263" };
string[] input = System.IO.File.ReadAllLines(@"/Users/tannerdale/Programs/practice_projects/advent_2021/1day/input_day1.txt");

Console.WriteLine("--- Part 1 ---");
Console.WriteLine("Practice: " + Part1(pracInput));
Console.WriteLine("Answer: " + Part1(input));

int Part2(string[] arr)
{
  int count = 0;
  int group1 = 0;
  int group2 = 0;
  int group3 = 0;

  for (int i = 0; i < arr.Length; i++)
  {
    int current = Int32.Parse(arr[i]);
    if (i == 0)
    {
      group1 += current;
    }

    if (i == 1)
    {
      group1 += current;
      group2 += current;
    }

    if (i % 3 == 0 && i > 1)
    {
      group2 += current;
      group3 += current;

      count += (group2 > group1) ? 1 : 0;

      group1 = current;
    } else if (i % 3 == 1 && i > 1)
    {
      group1 += current;
      group3 += current;

      count += (group3 > group2) ? 1 : 0;

      group2 = current;
    } else if (i > 2)
    {
      group1 += current;
      group2 += current;

      count += (group1 > group3) ? 1 : 0;

      group3 = current;
    }
  }
  return count;
}

Console.WriteLine("--- Part 2 ---");
Console.WriteLine("Practice: " + Part2(pracInput));
Console.WriteLine("Answer: " + Part2(input));
