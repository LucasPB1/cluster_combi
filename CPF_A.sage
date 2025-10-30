# Le but de ce fichier est de construire une fonction qui compte les faces de CPF
# stables par l'actiion de R_d et perm, rangées par dimension

# Ici perm est une permutation représentée par sa décomposition en cycles disjoints,
# d est l'ordre de la rotation considérée et n est là pour l'associer à S_n

from sage.combinat.set_partition_iterator import set_partition_iterator_blocks

def multinomial(L):
    sum = 0
    for i in L :
        sum += i
    mult = factorial(sum)
    for i in L :
        mult = mult / factorial(i)
    return mult # marche
    
def is_not_trivial_facet(n,d,perm): # Vérifie si ce n'est pas le complexe vide
    if (n+2)%d != 0 :
        return false
    else :
        for i in perm :
            if len(i)%d == 0 :
                return true
        return false # marche

def parabolic_type_facets(d,perm): # donne le type parabolique des facettes sous la forme d'une partition d'entier
    L = []
    k = 0
    for i in perm :
        if len(i)%d == 0 :
            L += [len(i)/d]*d
        else :
            k += len(i)
    L.append(k)
    return L # marche

def count_stable_dissections(n,d, parabolic_type): # compte les faces stables par R_d
    L = []
    i = 0
    while (i < len(parabolic_type)-d): 
        if parabolic_type[i:i+d] == [parabolic_type[i] for j in range(d)]:
            L.append(parabolic_type[i])
            i = i+d
        else :
            i+=1
    sum = 0
    for i in L :
        sum += 1
    return binomial((n+2-d)/d +sum, sum) * multinomial(polygons_count_by_size(L)) # semble marcher


def supp_above(i,L): # supprime les valeurs L[j] = L[i] si j > i
    if len(L)<= i+1:
        return L
    else :
        for j in range (len(L)-1,i, -1):
            if L[j] == L[i]:
                L.pop(j)
        return L #marche


def polygons_count_by_size(L): # compte le nombre de polygones de chaque taille
    i = 0
    count = 0
    c = []
    while i != len(L):
        for j in range(i,len(L)):
            if L[i] == L[j]:
                count += 1
        c.append(count)
        count = 0
        supp_above(i,L)
        i = i+1
    return c # marche


def facets_count(n, d, perm): # compte les facettes du complexe des points fixes
    if is_not_trivial_facet(n,d,perm):
        L = parabolic_type_facets(d,perm)
        facets = count_stable_dissections(n,d,L)
        #print(facets)
        L.pop()
        for i in polygons_count_by_size(L) : # On considère uniquement les polygones non-centraux
            #print(polygons_count_by_size(L))
            #print(facets)
            #print(i/d)
            #print(d^(i/d))
            facets = facets * factorial(i/d) * d^(i/d)
        return facets

    else :
        return 1 # semble marcher

# Maintenant on gère les non-facettes :

def smaller_min(L1,L2): # l'ordre total sur les cycles de perm
    return min(L1) <= min(L2)




            

        



