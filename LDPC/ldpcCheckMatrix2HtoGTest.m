

k=8;
wc=4;
wr=6;

[H Hr Hrr G] = ldpcHtoG(ldpcCheckMatrix2(k, wc, wr));


mod(G*H.',2)