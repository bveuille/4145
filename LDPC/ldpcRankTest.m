k=4;
wc=4;
wr=6;

H=ldpcCheckMatrix2(k,wc,wr)
[H Hr Hrr G]=ldpcHtoG2(H)

rankH=rank(H)
rankHrr=rank(Hrr)