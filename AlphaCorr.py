def isfloat(num):
    try:
        float(num)
        return True
    except ValueError:
        return False


with open ("C:/Uni/Masterarbeit/TestAlphaCorr/cellTypes", "r") as fp:
    HoleCells=[]
    startIndex=0
    lineIndex=0
    count=0
    for line in fp:
        if "boundary" in line:
            break
        if line[0]=="0" or line[0]=="1" or line[0]=="2":
            count+=1
            if startIndex==0:
                startIndex=lineIndex

        if line[0]=="2":
            HoleCells.append(lineIndex-startIndex)
        lineIndex+=1


print(len(HoleCells))
print(count)

newAlpha=open ("C:/Uni/Masterarbeit/TestAlphaCorr/newAlpha.water", "w")

with open ("C:/Uni/Masterarbeit/TestAlphaCorr/alpha.water", "r") as fp:
    corrLoop=True
    i=0
    startIndexWater=0
    lineIndexWater=0
    countWater=0
    for line in fp:
        if "boundary" in line:
            corrLoop=False


        if isfloat(line) and corrLoop==True:
            if float(line)<=2:
                countWater+=1
                if startIndexWater==0:
                    startIndexWater=lineIndexWater



        if HoleCells[i]==lineIndexWater-startIndexWater:
            newAlpha.write("0")
            newAlpha.write("\n")
            if i<len(HoleCells)-1:
                i+=1
                
        else:
            newAlpha.write(line)


        lineIndexWater+=1
    

print(countWater)



newp=open ("C:/Uni/Masterarbeit/TestAlphaCorr/newP", "w")
with open ("C:/Uni/Masterarbeit/TestAlphaCorr/p", "r") as fp:
    corrLoop=True
    i=0
    startIndexp=0
    lineIndexp=0
    countp=0
    for line in fp:
        if "boundary" in line:
            corrLoop=False


        if isfloat(line) and corrLoop==True:
            if float(line)<=2:
                countp+=1
                if startIndexp==0:
                    startIndexp=lineIndexp



        if HoleCells[i]==lineIndexp-startIndexp:
            newP.write("0")
            newP.write("\n")
            if i<len(HoleCells)-1:
                i+=1
                
        else:
            newP.write(line)


        lineIndexp+=1
    

print(countp)





newU=open ("C:/Uni/Masterarbeit/TestAlphaCorr/newU", "w")
with open ("C:/Uni/Masterarbeit/TestAlphaCorr/U", "r") as fp:
    corrLoop=True
    i=0
    startIndexU=0
    lineIndexU=0
    countU=0
    for line in fp:
        if "boundary" in line:
            corrLoop=False


        if isfloat(line) and corrLoop==True:
            if float(line)<=2:
                countU+=1
                if startIndexU==0:
                    startIndexU=lineIndexU



        if HoleCells[i]==lineIndexU-startIndexU:
            newU.write("0")
            newU.write("\n")
            if i<len(HoleCells)-1:
                i+=1
                
        else:
            newU.write(line)


        lineIndexU+=1
    

print(countU)