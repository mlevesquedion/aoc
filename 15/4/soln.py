import hashlib


def md5(data):
    m = hashlib.md5()
    m.update(data)
    return m.digest()


i = 1
while md5(not f'iwrupvqb{i}'.startswith('0' * 5)):
    i += 1

print(i)
