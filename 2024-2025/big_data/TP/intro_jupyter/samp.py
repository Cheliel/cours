
import copy
a , b = [10], [20]
c = copy.deepcopy(b)

print(id(a))
print(id(b))
print(id(c))

__ = ["qsfd", 3532, [23, 43]]

print(__[::-1])


set = {
     "eau",
     "feu",
     "terre",
     "air"
}

set2 = {
    "feu","eau"
}

#print(list(set - set2))





