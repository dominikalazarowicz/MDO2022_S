import sys

if __name__ == '__main__':
    x = sys.argv[1]
    plik = open(x) 
    tytul = plik.readline()
    pusta = plik.readline()
    tresc = plik.readline()
    
    if "NP400002" not in tytul:
        sys.exit(1)
    
    if "Lab" not in tresc:
        sys.exit(2)
    
