def positions(instructions):
    visited = set()
    x, y = 0, 0
    for i in instructions:
        direction, count = i[0], int(i[1:])
        if direction == "U":
            visited |= {(x, y + i) for i in range(1, count + 1)}
            x, y = x, y + count
        if direction == "D":
            visited |= {(x, y - i) for i in range(1, count + 1)}
            x, y = x, y - count
        if direction == "R":
            visited |= {(x + i, y) for i in range(1, count + 1)}
            x, y = x + count, y
        if direction == "L":
            visited |= {(x - i, y) for i in range(1, count + 1)}
            x, y = x - count, y
    return visited


def steps(instructions, intersections):
    x, y = 0, 0

    inter_steps = {}
    steps = 0
    for i in instructions:
        direction, count = i[0], int(i[1:])
        op = {
            "U": lambda x, y: (x, y + 1),
            "D": lambda x, y: (x, y - 1),
            "R": lambda x, y: (x + 1, y),
            "L": lambda x, y: (x - 1, y),
        }[direction]
        for i in range(count):
            x, y = op(x, y)
            steps += 1
            if (x, y) in intersections and (x, y) not in inter_steps:
                inter_steps[(x, y)] = steps

    return sorted(inter_steps.items())


def s1(w1, w2):
    return min(
        map(lambda p: abs(p[0]) + abs(p[1]), positions(w1) & positions(w2))
    )


def s2(w1, w2):
    intersections = positions(w1) & positions(w2)
    return min(
        c1 + c2
        for (_, c1), (_, c2) in zip(
            steps(w1, intersections), steps(w2, intersections)
        )
    )


if __name__ == "__main__":
    inp = [
        l.split(",")
        for l in "R75,D30,R83,U83,L12,D49,R71,U7,L72 U62,R66,U55,R34,D71,R55,D58,R83".split()
    ]
    print(s2(*inp))
    with open("input.txt") as f:
        line1, line2 = [l.split(",") for l in f.readlines()]
        print(s1(line1, line2))
        print(s2(line1, line2))
