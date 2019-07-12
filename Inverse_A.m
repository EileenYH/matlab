A=input('Matrix A')
%Build a Temp_Matrix:T=[A E], and E=A*inverse(A).
[m,n]=size(A);
if m~=n
    fprintf('Not a square matrix')
else
    if det(A)==0
        fprintf('A is a singular matrix')
    else
        for r=1:m
for c=1:n
if r==c
E(r,c)=1;
else
E(r,c)=0;
end
end
end
E
T=[A E]
%% 

for k=1:m
if T(k,k)==0
for i=k:m
if T(i,k)~=0
break
end
end
for j=1:2*m
temp_line(1,j)=T(i,j);
T(i,j)=T(k,j);
T(k,j)=temp_line(1,j);
end
end
end
T
%% 
for k=1:m
    if T(k,k)==0
        for i=1:m
            if T(i,k)~=0
                break
            end
        end
                for j=1:2*m
                    T(k,j)=T(i,j)+T(k,j)
                end
    end
end
T


%% 
for i=1:m-1
    coe=T(i,i);
    for j=1:2*m
        T(i,j)=T(i,j)/coe;
    end
        for u=i+1:m
            for o=u:m
                temp_coe=T(o,i);
            for l=1:2*m
                T(o,l)=T(o,l)-temp_coe*T(i,l);
            end
            for p=o:m
                if T(p,p)==0
                    for q=o+1:m
                        if T(q,p)~=0
                            break
                        end
                        for w=1:2*m
                            T(p,w)=T(p,w)+T(q,w);
                        end
                    end
                end
            end
            end
        end
end

coe_t=T(m,m);
for j=m:2*m
    T(m,j)=T(m,j)/coe_t
end
T
%%
for i=m-1:-1:1
    for k=i+1:m
        l=k;
        temp_coe=T(i,k)/T(l,k);
      for j=i:2*m;
        T(i,j)=T(i,j)-temp_coe*T(l,j);
      end
    end
end
T
%% 
for i=1:m
    for j=m+1:2*m
        inverse_A(i,j-m)=T(i,j);
        end
    end

inverse_A
    end
end
