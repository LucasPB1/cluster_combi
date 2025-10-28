def arecrossing(d1,d2):
    if d1 != d2:
        if (d1[0] < d2[0] < d1[1] < d2[1]) or (d2[0] < d1[0] < d2[1] < d1[1]):
            return true
        return false
    else :
        return true

# Ici un sommet de CPF est représenté par (d,G,D) où d est la diagonale, G est
# l'ensemble des étiquettes à gauche et D est l'ensemble des étiquettes à droite

def are_compatible(v1,v2):
    if arecrossing(v1[0], v2[0]):
        return false
    else :
        if (v1[0][0] < v2[0][0] < v2[0][1] < v1[0][1]):
            return (v1[2] in v2[2])
        elif (v2[0][0] < v1[0][0] < v1[0][1] < v2[0][1]):
            return (v2[2] in v1[2])
        elif (v2[0][0] > v1[0][1] and v2[0][1] > v1[0][1]):
            return (v2[1] in v1[2])
        else :
            return (v1[1] in v2[2])

def 
    



        