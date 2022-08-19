import pytest

# return the number of steps for n to reach 1.
# n can either be incremented by 1 or decremented by 1 or get halved if it is even
# i is the number of steps taken so far

def solution(n):
    fastMap = {}
    for i in range(1,100,1):
        fastMap[2**i] = i
    (x,a) = helper(int(n),0,fastMap)
    return a

def helper(n,i,fastMap):
    if(n==1):
        return (n,i)
    inc = n+1
    dec = n-1
    if n in fastMap:
        return (n,fastMap[n]+i)
    #if inc in fastMap:
    #    return (n,fastMap[inc]+i+1)
    #if dec in fastMap:
    #    return (n,fastMap[dec]+i+1)

    if(n%2==0):
        (x,a) = half(n,i,fastMap)
        #print(x,a)
        fastMap[n] = a
        return (x,a)
    else:
        (y,b) = minus(n,i,fastMap)
        (z,c) = plus(n,i,fastMap)
        print(y,b)
        print(z,c)
        if b < c:
            fastMap[n] = b
            return (y,b)
        else:
            fastMap[n] = c
            return (z,c)

def half(n,i,fastMap):
    if(n==1): 
        return (n,i)
    else:
        (x,a) = helper(n/2,i+1,fastMap)
        fastMap[n] = a
        return (x,a)

def plus(n,i,fastMap):
    if(n==1):
        return (n,i)
    else:
        (x,a) = helper(n+1,i+1,fastMap)

        fastMap[n] = a
        return (x,a)

def minus(n,i,fastMap):
    if(n==1):
        return (n,i)
    else:
        (x,a) = helper(n-1,i+1,fastMap)
        fastMap[n] = a
        return (x,a)


class TestClass:
    def test_one(self):
        #15 -> 16 -> 8 -> 4 -> 2 -> 1
        assert solution(15)==5

    def test_two(self):
        #4 -> 2 -> 1
        assert solution(4)==2

    def test_three(self):
        #13 -> 12 -> 6 -> 3 -> 2 -> 1
        assert solution(13)==5

    def testBig(self):
        assert solution(12342321)==31

@pytest.mark.parametrize("test_input,expected", 
[(1	,0),
(2 	, 1)    ,
(3 	, 2)    ,
(4 	, 2   ) ,
(5 	, 3   ) ,
(6 	, 3   ) ,
(7 	, 4   ) ,
(8 	, 3   ) ,
(9 	, 4   ) ,
(10	,	4 ) ,
(11	,	5 ) ,
(12	,	4 ) ,
(13	,	5 ) ,
(14	,	5 ) ,
(15	,	5 ) ,
(16	,	4 ) ,
(17	,	5 ) ,
(18	,	5 ) ,
(19	,	6 ) ,
(20	,	5 ) ,
(21	,	6 ) ,
(22	,	6 ) ,
(23	,	6 ) ,
(24	,	5 ) ,
(25	,	6 ) ,
(26	,	6 ) ,
(27	,	7 ) ,
(28	,	6 ) ,
(29	,	7 ) ,
(30	,	6 ) ,
(31	,	6 ) ,
(32	,	5 ) ,
(33	,	6 ) ,
(34	,	6 ) ,
(35	,	7 ) ,
(36	,	6 )])

def test_solution(test_input, expected):
    assert solution(test_input) == expected

    #def massAssert(self):
    #    for i,j in :
    #        assert solution(i)==j


        #30 -> 

#print(solution('4'))
#print(solution('15'))
#print(solution('13'))
#print(solution('16'))
print(solution('254'))
#print(solution('100'))
# 254 -> 127 -> 128 -> 64 -> 32 -> 16 -> 8 -> 4 -> 2 -> 1
# 100 -> 50 -> 25 -> 24 -> 12 -> 6 -> 3 -> 2 -> 1 
#


