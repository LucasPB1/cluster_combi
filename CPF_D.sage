# Pour utiliser ce fichier, notez que :
# - perm est une permutation de type D_n représentée en cycles disjoints
# - max_parabolic_type représente la structure en sous-gones, pas le type parabolique


def coxeter_rk(perm): # Calcule le rang de Coxeter du groupe qui contient perm
    l = 0
    for i in perm :
        l += len(i)
    return l /2

def cycles(perm): # Donne la structure en cycles [] et (()) d'une permutation de type B/D
    part = []
    perm2 = perm.copy()
    for i in perm2 :
        if len(i) % 2 == 1:
            part.append((len(i), False))
            l = [-j for j in i]
            perm2.remove(l)
        else :
            dc = True
            for j in range(len(i)):
                if i[j] != i[j+(len(i)/2)]:
                    dc = False
            if dc :
                part.append((len(i)/2, True))
            else :
                part.append((len(i), False))
                l = [-j for j in i]
                perm2.remove(l)
    return part

def has_diameters(d,m,part):
    n = 0
    for i in part :
        n += i[0]
    if n % d != 0 :
        return False
    if d%2 == 1 :
        for i in part :
            if i[0] % d != 0 or i[1] :
                return False
        return True
    else :
        for i in part :
            if i[0] % (d/2) != 0 or not(i[1]):
                return False
        return True
            



def not_trivial_subcomplex(d,m,perm): # détermine si le complexe des points fixes est non-vide
    if 2*m*(n-1)+2 % d != 0 :
        return False
    else :
        part = cycles(perm)
        if d % 2 == 1 :
            for i in part:
                if not(i[1]) and i % d == 0 :
                    return True
            return False
        else :
            for i in part:
                if i[1] and i % d/2 == 0:
                    return True
            return False



def max_parabolic_type(d,m,part): # donne la partition d'entier correspondant au(x) type(s) parabolique max
    typ = []
    if not_trivial_subcomplex(d,m,perm):
        if d % 2 == 0 :
            for i in part :
                if i[1] and i[0] % d/2 == 0:
                    typ += (d/2) * [i[0] / (d/2)]
        else :
            for i in part :
                if not(i[1]) and i[0] % d == 0 :
                    typ += d * [i[0] / d]
    return typ

def facets_count(d,m,part):
    if not_trivial_subcomplex(d,m,part):
        if has_diameters(d,m,part):
            return # type D
        else :
            return # type B
    else :
        return 1
    



    
