def fuel(mass):
    return mass // 3 - 2


def sol1(masses):
    return sum(map(fuel, masses))


def sol2(masses):
    total = 0
    for mass in masses:
        while mass > 0:
            mass = fuel(mass)
            total += max(mass, 0)
    return total


with open("input.txt") as f:
    masses = [int(line) for line in f.readlines()]
    print(sol1(masses))
    print(sol2(masses))
