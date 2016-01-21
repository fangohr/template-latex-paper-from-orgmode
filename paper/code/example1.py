def adder(n):
    def add_n(x):
        return x + n
    return add_n

f = adder(42)

print("What is the answer?")
print(f(0))
