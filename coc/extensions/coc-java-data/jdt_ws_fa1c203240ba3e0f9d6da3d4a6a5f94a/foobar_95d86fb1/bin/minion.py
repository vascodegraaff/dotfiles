# input an array of numbers and remove the numbers that occurs n or more times
def solution(data, n):
    dict = {}
    ret = []
    for i in data:
        if i in dict:
            dict[i] += 1
        else:
            dict[i] = 1
    for j in range(len(data)):
        if dict[data[j]] <= n:
            ret.append(data[j])
    return ret

print(solution([5, 10, 15, 10, 7],1))
print(solution([1, 2, 2, 3, 3, 3, 4, 5, 5], 1))
