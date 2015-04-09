function [bestcost,besttour]=LSforTSP(cost,tour,D,n)

besttour=tour;
bestcost=cost;

for i=1:n-3
    for j=i+2:n
        newtour=tour;
        newtour(i+1:j)=tour(j:-1:i+1);
        newcost=0;
        for k=1:n
            newcost=newcost+D(newtour(k),newtour(k+1));
        end
        if newcost<bestcost
            bestcost=newcost;
            besttour=newtour;
        end
    end
end

if bestcost<cost
    [bestcost,besttour]=LSforTSP(bestcost,besttour,D,n);
end

supertour = [7 13 11 10 9 8 1 2 3 4 5 6 12 14 7];
supercost=0;
for k=1:n
            supercost=supercost+D(supertour(k),supertour(k+1));
end
supercost
