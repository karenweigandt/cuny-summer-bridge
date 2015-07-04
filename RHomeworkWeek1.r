# Week 1 assignment question 1
# code to calculate 12 factorial

factvect <- 12:1
twelvefactvect <- rep(NA_integer_, 13)
ct <- 1
twelvefactvect[1] <- 1
while (ct <= 12)
{
  b <- ct + 1
  twelvefactvect[b] <- twelvefactvect[ct] * factvect[ct]
  ct <- ct +1
}
print("Twelve factorial is: ")
print(twelvefactvect[13])

# week 1 assignment question 2
# numeric vector that contains the sequence from 20 to 50 by 5

q2 <- seq(20, 50, by=5)
print(q2)

# week 1 assignment question 3
# implement quadratic equation

#get values for a,b and c. Solve quadratic equation
print("SOlution for Quadratic equation ax^2 + bx + c = 0")


theUrl3 <- "D:\\abc2.csv"
abc3 <- read.table(file = theUrl3, header = TRUE, sep = ",")
head(abc3)


a <- abc3[1]
b <- abc3[2]
c <- abc3[3]
f <- 1

bsq <- b * b
# print(bsq)
d <- 4 * a * c
# print(d)
e <- bsq - d
# print(e)
if (e < 0)
{
  print ("No real number solution")
  
} else 
  if (e == 0)
  {  
    f <- sqrt(e)
    # print(f)
    g1 <- b * (-1) 
    # print(g1)
    h1 <- g1/(2 * a)
    #print(h1)
    
    print("The solution is x = ")
    print(h1)
    print("Single solution")
  } else 
    if (e > 0)
    {
      f <- sqrt(e)
      # print(f)
      g1 <- b * (-1) + f
      # print(g1)
      h1 <- g1/(2 * a)
      #print(h1)
      
      g2 <- b * (-1) - f
      # print(g2)
      h2 <- g2/(2 * a)
      # print(h2)
      
      print("The solution is x = ")
      print(h1)
      print("or x = ")
      print(h2)
    }

