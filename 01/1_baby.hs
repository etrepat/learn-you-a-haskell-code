-- Use ghci as a calculator
-- Negative numbers
-- Error messages: 5 + "potato"
-- Function call: a b c d
    -- a must be a function; b, c, d its arguments.
    -- no parens nor commas
    -- application is "space"
    -- higher priority
    -- Fun as infix op: f x y = x `f` y
    -- Infix op as fun: x op y = (op) x y
-- Load file :load filename

-- some difference with book
  -- ghc 6.12.3 vs 8.0.2
  -- don't need to "let" in ghci (although I don't know if never)

-- function names and parameters: initial lowecase

doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y

-- if is an expression not a statement

doubleSmallNumber x = if x > 100
    then x
    else x*2

-- can use ' (prime)

doubleSmallNumber' x = (if x > 100 then x else x*2)

conanO'Brien = "It's a-me, Conan O'Brien!"
lostNumbers = [4,8,15,16,23,42]

-- list (simple linked list): basic in functional programming
  -- persistent data structure `par excellence`
  -- lists are HOMOGENEOUS

concatenateLists = [1,2,3,4] ++ [9,10,11,12] -- [a] ++ [a]

  -- Strings are simply Lists of Chars
    -- all functions on lists can act on Strings

concatenateStrings = "hello" ++ " " ++ "world"
concatenateStrings' = ['w','0'] ++ ['0','t']

consStrings = 'A':" SMALL CAT" -- a:[a]
consNumbers = 5:[1,2,3,4,5]
consNumbers' = 5:1:2:3:4:5:[]

indexString = "Steve Buscemi" !! 6
indexList = [9.4,33.2,96.2,11.2] !! 1
listInList = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4]]
indexList' = listInList !! 1

-- comparisons of lists are done lexicographically
  -- and you need to be able to compare the elements of the list
  -- (more on this next session on classtypes)
  -- nonempty greater that empty

compareList = [3,2,1] > [2,1,0] -- determined element by element
compareList' = [3,4,2] < [3,4,3]

-- head & tail of empty list is an error
  -- head [] blows
  -- a = head [] doesn't
  -- WHY ?

headList = head [5,4,3,2,1] -- 5
tailList = tail [5,4,3,2,1] -- [4,3,2,1]
lastList = last [5,4,3,2,1] -- 1
initList = init [5,4,3,2,1] -- [5,4,3,2]

startList = [5,4,3,2,1]
middleOfList = init (tail startList) -- [4,3,2]
middleOfList' = tail (init startList) -- [4,3,2]

-- does not need to evaluate the elements of the list

lengthList = length [5,4,3,2,1] -- 5

isNull = null [1,2,3] -- False

reverseList = reverse [5,4,3,2,1] -- [1,2,3,4,5]

takeFirst3 = take 3 [5,4,3,2,1] -- [5,4,3]
takeFirst100 = take 100 [5,4,3,2,1] -- [5,4,3,2,1]
takeNone = take 0 [5,4,3,2,1] -- []

max = maximum [1,9,2,3,4] -- 9
min = minimum [8,4,2,1,5,6] -- 1

sumList = sum [5,2,1,6,3,2,5,7] -- 31
productList = product [6,2,1,2] -- 24

inList = elem 4 [3,4,5,6] -- True
inList' = 4 `elem` [3,4,5,6] -- True

-- ranges simplify the construction of some lists
  -- you need elements that can be enumerated
  -- (typeclass Enum)

rangeNumber = [1..20] -- expand the list 1,2,3,...,20
rangeCharacter = ['k'..'z'] -- same for k to z
rangeStep = [2,4..20] -- all evens between 2 and 20
rangeDecreasing = [20,19..1] -- 20,19,18,17,...,1

rangeSteppedInfiniteTake = take 10 [13,26..] -- first 10 multiples of 13

-- you can work with infinite lists !!!
  -- obviously if you only need a finite part to get the result

cycleListTake = take 10 (cycle [1,2,3]) -- [1,2,3,1,2,3,1,2,3,1]
repeatElementTake = take 10 (repeat 5) -- [5,5,5,5,5,5,5,5,5,5]
replicateElement = replicate 3 10 -- 3 `replicate` 10 -- [10,10,10]

-- ranges with floats are tricky

rangeFloatDodgy = [0.1, 0.3 .. 1] -- expand a float range, weird values...

-- list comprehensions

comprehensionMultiplesTwo = [x*2 | x <- [1..10]]
comprehensionMultiplesTzip  woFilterMultiples = [x*2 | x <- [1..10], x*2 >= 12]
comprehensionFilterMod = [x | x <- [50..100], x `mod` 7 == 3]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

comprenhensionFilterNot = [x | x <- [10..20], x /= 13, x /= 15, x /= 19]

comprehensionDrawMultipleList = [x+y | x <- [1,2,3], y <- [10,100,1000]]
comprehensionDrawMultipleList' = [x*y | x <- [2,5,10], y <- [8,10,11]]
comprehensionDrawMultipleListFilter = [x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]

nouns = ["hobo", "frog", "pope"]
adjectives = ["lazy", "grouchy", "scheming"]
descriptions = [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]

-- is idiomatoc to use _ as a placeholder meaning: don't care

length' xs = sum [1 | _ <- xs]

removeNonUpperCase st = [c | c <- st, c `elem` ['A'..'Z']]

-- lists of lists (but homogeneous ones)
  -- idiomatic names of variables x, xs, xss, xsss, ...
  -- (the book uses xxs but I don'l like it)

xss = [[1,2,3,4,5],[9,8,7,6,5],[5,4,3,2,1]]
onlyEven = [ [x | x <- xs, even x] | xs <- xss]

-- tuples group HETEROGENEOUS values
  -- fst, snd accessors for pairs
  -- only comparable if same size

pair = (1,3)
triple = (3, 'a', "hello")
tuple4 = (50, 50.4, "hello", 'b')

first = fst (8, 11)
second = snd (8, 11)

zipList = zip [1,2,3,4,5] [5,5,5,5,5]
zipList' = zip [1..5] ["one","two","three","four","five"]
zipListDifferentLength = zip [1..] ["i'm","a","turtle"]

-- Finding right angle triagles
--   length of the three sides are all integers
--   length of each side is less than or equal to 10
--   triangle's perimeter is equal to 24
--   no duplicates e.g. (1,3,5) == (3,5,1) == (5,3,1) etc
triples = [ (a,b,c) | c <- [1..10],
                      a <- [1..c],
                      b <- [1..a],
                      a^2 + b^2 == c^2,
                      a+b+c == 24]
