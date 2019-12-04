def run_program(program, noun, verb):
    i = 0
    program[1], program[2] = noun, verb
    while i < len(program) and program[i] != 99:
        opcode, left, right, dest = program[i : i + 4]
        if opcode == 1:
            program[dest] = program[left] + program[right]
        else:
            program[dest] = program[left] * program[right]
        i += 4
    return program[0]


def solve(program):
    for i in range(len(program)):
        for j in range(len(program)):
            if run_program(program[:], i, j) == 19690720:
                return i, j


with open("input.txt") as input_:
    print(solve(list(map(int, input_.read().split(",")))))
