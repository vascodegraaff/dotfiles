

#1
#2 3
#4 5 6 7

#7
#3 6
#1 2  4 5


#[7 3 6 1 2 4 5]
#[7 3 1 2 4 6 5]
#[1 2 3 4 5 6 7]


class Node:
    def __init__(self, key, left, right):
        self.left = left 
        self.right = right
        self.value = key

class PostOrder:
    def __init__(self):
        self.counter = 1
    def postOrderTraversal(self,tree):
        if(tree.left!=None):
            self.postOrderTraversal(tree.left)
        if(tree.right!=None):
            self.postOrderTraversal(tree.right)
        tree.value = self.counter
        self.counter+=1
        
#COUNT = [5]
## Function to print binary tree in 2D
## It does reverse inorder traversal
#def print2DUtil(root, space) :
# 
#    # Base case
#    if (root == None) :
#        return
# 
#    # Increase distance between levels
#    space += COUNT[0]
# 
#    # Process right child first
#    print2DUtil(root.right, space)
# 
#    # Print current node after space
#    # count
#    print()
#    for i in range(COUNT[0], space):
#        print(end = " ")
#    print(root.value)
# 
#    # Process left child
#    print2DUtil(root.left, space)
# 
## Wrapper over print2DUtil()
#def print2D(root) :
#     
#    # space=[0]
#    # Pass initial space count as 0
#    print2DUtil(root, 0)

# generate a perfect binary tree of height h
def generateTree(h):
    if(h==0):
        return None
    else:
        if(h==1):
            return Node(1,None,None)
        else:
            return Node(1,generateTree(h-1),generateTree(h-1))
    


def getParent(tree,value):
    if(tree.left==None and tree.right==None):
        return -1
    if(tree.right.value == value or tree.left.value == value):
        return tree.value
    else:
        left = getParent(tree.left,value)
        right = getParent(tree.right,value)
        return left if left!=-1 else right





#def find(tree,indices):
#    flatTree = flattenTree(tree)
#    print(flatTree)
#    return [flatTree[i] if i < len(flatTree) else -1 for i in indices]

def solution(h,q):
    tree = generateTree(h)
    postOrder = PostOrder()
    postOrder.postOrderTraversal(tree)
#    print2D(tree)
    return [getParent(tree,i) for i in q]
    #return find(tree,q)

print(solution(3,[7,3,5,1]))
print("expected: [-1,7,6,3]")
print(solution(3,[1,4,7]))
print("expected: [3,6,-1]")
print(solution(5, [19, 14, 28]))
print("expected: [21,15,29]")

