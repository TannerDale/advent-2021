string[] pracInput = [
  "00100",
  "11110",
  "10110",
  "10111",
  "10101",
  "01111",
  "00111",
  "11100",
  "10000",
  "11001",
  "00010",
  "01010"
];

static void fromFile()
{
  string[] lines = System.IO.File.ReadAllLines(@"/Users/tannerdale/Programs/practice_projects/advent_2021/3day/input_day3.txt");
  foreach (string line in lines)
  {
    Console.WriteLine(line);
  }
}


fromFile();
