def coxeter_arrangement(W):
    L = ['x' + str(i+1) for i in range(4)]
    H = HyperplaneArrangements(RR, tuple(L))
    A = H()
    for alpha in W.positive_roots():
        B = H([tuple(alpha), 0])
        A = A.union(B)
    return A

def OS_lattice(W):
    L = posets.BooleanLattice(W.cartan_type()[1], use_subsets = True)
    D = dict()
    for i in L :
        if i == L.top():
            D[i] = i
        else :
            l = []
            for j in OStest(i) :
                for m in range(j[1]):
                    l += j[0].roots()
                l1 = [ k[0] for k in l]
            D[i] = (i, tuple(l1))
    return L.relabel(D)


# Objectif : Trouver une condition pour qu'une chaine préserve les premiers coeffs

# Suite : Considérer les chaines maximales et trouver toutes celles qui satisfont ça

def initial_l(l1,l2):
    """ Teste si l1 est un segment initial de l2 comme liste """
    for i in range(len(l1)):
        if l1[i] != l2[i] :
            return False
    return True

def OS_preserves(C):
    """ Teste si la chaine C du treillis préserve les premiers coefficients d'Orlik-Solomon """
    for i in range(len(C)-2) :
        if not(initial_l(sorted(C[i+1][1]),sorted(C[i][1]))) :
            return False
    return True

def preserving_chains(W):
    L = OS_lattice(W)
    Ch = []
    for C in L.maximal_chains():
        if OS_preserves(C) :
            Ch.append(C)
    return Ch



            


