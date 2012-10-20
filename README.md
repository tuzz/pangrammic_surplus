## Pangrammic Surplus

Determines the surplus of characters that satisfies a self-enumerating pangram.

## Concept

When searching for self-enumerating pangrams, you'll often start with some boilerplate text and attempt to satisfy it with a list of numbers, for example:

```This pangram lists one a, two b's, three c's ..... and one z.```

In this case, the boilerplate is ```This pangram lists and```

Pangrammic Surplus turns things the other way around. We give it a list of numbers and it tells us what characters are left to build boilerplate text from.

For example:

```ruby
  require 'pangrammic_surplus'

  surplus = PangrammicSurplus.for(
    'a' => 4, 'b' => 1, 'c' => 1, 'd' => 2, 'e' => 29, 'f' => 8, 'g' => 3,
    'h' => 5, 'i' => 11, 'j' => 1, 'k' => 1, 'l' => 3, 'm' => 2, 'n' => 22,
    'o' => 15, 'p' => 2, 'q' => 1, 'r' => 7, 's' => 26, 't' => 19, 'u' => 4,
    'v' => 5, 'w' => 9, 'x' => 2, 'y' => 4, 'z' => 1
  )

  puts surplus.inspect
  # 'a' => 3, 'b' => 0, 'c' => 0, 'd' => 1, 'e' => 0, 'f' => 0, 'g' => 1,
  # 'h' => 1, 'i' => 2, 'j' => 0, 'k' => 0, 'l' => 1, 'm' => 1, 'n' => 2,
  # 'o' => 0, 'p' => 1, 'q' => 0, 'r' => 1, 's' => 3, 't' => 2, 'u' => 0,
  # 'v' => 0, 'w' => 0, 'x' => 0, 'y' => 0, 'z' => 0

  non_zero_letters = surplus.reject { |letter, count| count.zero? }
  puts non_zero_letters.inspect
  # 'a' => 3, 'd' => 1, 'g' => 1, 'h' => 1, 'i' => 2, 'l' => 1, 'm' => 1,
  # 'n' => 2, 'p' => 1, 'r' => 1, 's' => 3, 't' => 2
```

If we can construct boilerplate from an anagram of these letters, we have a true self-enumerating pangram.

```This pangram lists and``` is one possible anagram, in this case.

And therefore, the following is a true self-enumerating pangram:

"This pangram lists four a's, one b, one c, two d's, twenty-nine e's, eight f's, three g's, five h's, eleven i's, one j, one k, three l's, two m's, twenty-two n's, fifteen o's, two p's, one q, seven r's, twenty-six s's, nineteen t's, four u's, five v's, nine w's, two x's, four y's, and one z."
