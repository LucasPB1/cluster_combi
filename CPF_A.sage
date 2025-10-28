# Le but de ce fichier est de construire une fonction qui compte les faces de CPF
# stables par l'actiion de R_d et perm, rangées par dimension

# Ici perm est une permutation représentée par sa décomposition en cycles disjoints,
# d est l'ordre de la rotation considérée et n est là pour l'associer à S_n

def multinomial(L):
    sum = 0
    for i in L :
        sum += i
    mult = factorial(sum)
    for i in L :
        mult = mult / factorial(i)
    return mult
    
def is_not_trivial_facet(n,d,perm): # Vérifie si ce n'est pas le complexe vide
    if (n+2)%d != 0 :
        return false
    else :
        for i in L :
            if len(i)%d == 0 :
                return true
        return false

def parabolic_type_facets(n,d,perm):
    L = []
    k = 0
    for i in perm :
        if len(i)%d == 0 :
            L += [len(i)/d]*d
        else :
            k += len(i)
    L.append(k)

def supp_above(i,L):
    if len(L)>= i+1:
        return L
    else :
        for j in range (len(L)-1,i, -1):
            if L[j] == L[i]:
                L.pop(j)
        return L 


def polygons_count_by_size(L):
    i = 0
    count = 0
    while L != []:
        for j in range(i,len(L)):
            if len(L[i]) == len(L[j]):
                count += 1
        i = i+1 
        count = 0
        supp_above(i,L)
    return L


def facets_count(n, d, perm): # compte les facettes du complexe des points fixes
    if is_not_trivial_facet(n,d,perm):
        L = parabolic_type_facets(n,d,perm)
        facets = multinomial(L)
        for i in polygons_count_by_size(L.pop()) : # On considère uniquement les polygones non-centraux
            facets = facets * factorial(i)
        return facets
    else :
        return 1
            

        



