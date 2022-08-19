
# find a

#Input:
#Solution.solution({4, 30, 50})
#Output:
#    12,1

# last gear must be half the size of the first one
#

# formulas
# r_1 = 2r_n
# x_1 = 
# r_2 = 
#

# example with 2
# x1 = 0
# x2 = 6
# r1 = 4
# r2 = 2

# x1 = 2
# x2 = 4
# r1 = 4/3, (x2-x1)*2r_n/3r_n
# r2 = 2/3
#

# example with 3
# x1 = 0
# x2 = 5
# x3 = 8
# r1 = 4
# r2 = 1
# r3 = 2
#
#r_1 = 2r_n
#r_2 = x_2 - (x_1 + r_1)
#r_n = x_n - (x_n-1 + r_n-1)

# r_n = x_n - (x_n-1 + r_n-1)

#r_1 = 2(x_n - (x_n-1 + r_n-1))


#r_1 = 2r_3
#r_2 = 5 - (0 + r_1)
#r_3 = 8 - (5 + r_2)

# r_1 = 2(8 - (5 + (5 - (0 + r_1))))
# r_1 = 2(8 - (10 -  r_1))
# r_1 = 2(-2 + r_1)
# r_1 = -4 + 2r_1
# r_1 = 4


def solution(pegs):
    r = []
    n = len(pegs)
    r1 = 0
    if n%2==0:
        for i in range(len(pegs)-1,-1,-1):
            if i==0 or i==n-1:
                r1 += (-1)**(i+1) * (2*pegs[i])
            else:
                r1 += (-1)**(i+1) * (4*pegs[i])
        print(r1)
        r.append(r1/3)
    else:
        for i in range(len(pegs)-1,-1,-1):
            if i==0 or i==n-1:
                r1 += (-1)**(i+1) * 2*pegs[i]
            else:
                r1 += (-1)**(i+1) * 4*pegs[i]
        print(r1)
        r.append(r1)


    for i in range(len(pegs)-1):
        rad = pegs[i+1]-(pegs[i]+r[i])
        r.append(rad)
        #print(rad)
        if rad <= 0:
            return [-1,-1]

    print(r)

    if r1 <= 0:
        return [-1,-1]
    else:
        if(n%2==0):
            if r1<3:
                return [-1,-1]
            elif r1%3==0:
                return [r1/3,1]
            else:
                return [r1,3]
        else:
            if r1<1:
                return [-1,-1]
            return [r1,1]

    
        

#yes
print("yes")
print(solution([0,3]))

print(solution([0,10]))
print(solution([4,30,50]))
print(solution([0,15,25,35]))
#no
print("no")
print(solution([4,20,50]))
print(solution([0,3,5]))

