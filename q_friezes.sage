C_q = PolynomialRing(ZZ,'q')
q = C_q.gen()

def q_entier(n):
    P = 0
    for i in range(n):
        P += q^i
    return P

def next_row(row_a, row_b): 
    n = len(row_a)
    F = []
    for i in range(n):
        F.append((row_b[i] * row_b[(i+1) % n] - 1) / row_a[(i+1)%n])
    return F

def q_next_row(row_a, row_b): # à adapter
    n = len(row_a)
    F = []
    for i in range(n):
        F.append((row_b[i] * row_b[(i+1) % n] - 1) / row_a[(i+1)%n])
    return F


def CC_frieze(quiddity):
    one = [1 for i in quiddity]
    F = [ one, quiddity]
    l1 = one.copy()
    l2 = quiddity.copy()
    l = []
    while(l != one):
        l = next_row(l1,l2)
        l1 = l2.copy()
        l2 = l.copy()
        F.append(l)
    return F

def q_frieze(quiddity): # à adapter
    one = [1 for i in quiddity]
    F = [ one, quiddity]
    l1 = one.copy()
    l2 = quiddity.copy()
    l = []
    while(l != one):
        l = next_row(l1,l2)
        l1 = l2.copy()
        l2 = l.copy()
        F.append(l)
    return F
    

def see(F):
    for i in range(len(F)):
        print(i*"  ", F[i])


