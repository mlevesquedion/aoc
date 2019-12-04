def solve(program):
    i = 0
    program[1], program[2] = 12, 2
    while i < len(program) and program[i] != 99:
        opcode, left, right, dest = program[i : i + 4]
        if opcode == 1:
            program[dest] = program[left] + program[right]
        else:
            program[dest] = program[left] * program[right]
        i += 4
    return program[0]


with open("input.txt") as input_:
    print(solve(list(map(int, input_.read().split(",")))))
