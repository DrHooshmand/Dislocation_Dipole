%%%%%%%%%   Mohammad Shahriar Hooshmand   %%%%%%%%%%%%
%%%%%%%%%%%       MSE OSU       %%%%%%%%%%%   
%%%%%%%%%%%     Fall 2018       %%%%%%%%%%%  

% Z: dislocation line, X: cut vector 
% A and B are vectors in orthogonal basis along X and Y, respectively
% t,s : output to define tilted cell vector direction (B=tA+sB)  
% m: periodicity along X (int) 
% n: periodicity along Y (int) (along tilted cell vector)
% Alpha : angle between two cell vectors in oblique cell


clear;
clc;
a=5.76268;
A = 1/2*[1 2 1];
B = [1 -1 1];
er= 0.1;
iter = 20;
dis = {'m','n','t','s','error','alpha'};
fprintf('%s, ', dis{1:end-1}); fprintf('%s ', dis{end}); fprintf('\n'); fprintf('\n');

for s=1:1:iter
    for t=1:1:iter
        for m=1:1:iter
            for n=1:1:iter
                    sum = (t*A+s*B);
                    alpha = acosd( dot( sum,A) /(norm(A) * norm(sum)) );
                    left = m/(n*sind(alpha));
                    right = ( 2* norm(sum) / (norm(A)) ); 
                    if ( abs( left-right)  ) <= er && (abs( (cosd(alpha))-(m*norm(A)/(2*n*norm(sum))) ) <=er )
                        fprintf('%i %i %i %i %f %f \n', m,n,t,s,( abs( left-right) ), alpha)
                    end
               

            end
        end
    end
end
