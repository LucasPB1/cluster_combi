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

def k_sums_minus_1(L,k):
    l = []
    for i in range(len(L)):
        a = 0
        for j in range(k):
            a += L[(i+j) % len(L)]-1
        l.append(a)
    return l

def q_next_row(row_a, row_b, quiddity,k): # à adapter
    n = len(row_a)
    F = []
    sums = k_sums_minus_1(quiddity,k)
    for i in range(n):
        F.append(((row_b[i] * row_b[(i+1) % n] - q^(sums[i])) / row_a[(i+1)%n]))
    return F

def is_not_q_powers(L):
    if L == []:
        return true
    for i in L:
        j = i
        while(j % q == 0):
            j = j / q
        if j != 1 :
            return False
    return True


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
    F1 = CC_frieze(quiddity)
    width = len(F1)
    one = [1 for i in quiddity]
    F = [ one, [ q_entier(i) for i in quiddity]]
    l1 = one.copy()
    l2 = [ q_entier(i) for i in quiddity]
    l = []
    k = 1
    while(len(F) != width):
        l = q_next_row(l1,l2,quiddity,k)
        l1 = l2.copy()
        l2 = l.copy()
        F.append(l)
        k += 1
    return F

def triangulation(quiddity):
    F = CC_frieze(quiddity)
    l = [i[0] for i in F]
    t = path_tableaux.FriezePattern(l)
    return t.triangulation()

def see(F):
    for i in range(len(F)):
        print(i*"  ", F[i])


