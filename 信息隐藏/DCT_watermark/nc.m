%Name:		wei--kai19830426@163.com
%Course:	Digital Watermarking
%Project: 	Calculates the NC (Normalized Correlation)
%function:  of watermark images A and A', both of size MxN
%%%%%%% NC %%%%%%

function N=nc(mark_get,mark_prime)
mark_get=double(mark_get);
mark_prime=double(mark_prime);
if size(mark_get)~=size(mark_prime)
    error('Input vectors must  be the same size!')
else
    [m,n]=size(mark_get);
    fenzi=0;
    fenmu=0;
    for i=1:m
        for j=1:n
            fenzi=fenzi+mark_get(i,j)*mark_prime(i,j);
            fenmu=fenmu+mark_prime(i,j)*mark_prime(i,j);
        end
    end
N=min(fenzi/fenmu,fenmu/fenzi);
end