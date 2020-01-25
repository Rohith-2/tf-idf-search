clear all
clc
format long 
filename = "123.txt";
str = extractFileText(filename);
textData = split(str,'.')
documents = tokenizedDocument(textData);
bag = bagOfWords(documents);
M = tfidf(bag);
[a b]=size(M);
A = full(M(1:a,1:b));
[m,n]=size(A);
qm=zeros(1,n);
p = 'No of words : ';
t = input(p);
for r = 1:t
prompt = 'Search: ';
thresh = input(prompt,'s');
qm(bag.Vocabulary==thresh)=1;
end
 r=qm.*A;
 r=sum(r,2);
 for i=1:m
 if r(i)==max(r)
     disp("Top hit: Sentence "+ i);
      continue  
 end
 end