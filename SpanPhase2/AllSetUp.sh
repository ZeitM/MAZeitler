MainIndex=1
for i in $(seq 0.10 0.06 0.94)
do      
    mkdir Main$MainIndex/0/
    cp ../newPointMotionU/pointMotionU$i Main$MainIndex/0/pointMotionU
    if MainIndex==1
    do
        cp -r Start0/0.orig Main1/0
    done
    
    ((MainIndex++))
done
