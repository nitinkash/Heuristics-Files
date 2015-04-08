
%First we find the adjacency matrix
path = 'C:\Nitin\Study\621\karate.gml';
A = [];
inputfile = fopen(path);
l=0;
k=1;
while 1
      % Get a line from the input file
      tline = fgetl(inputfile);
      % Quit if end of file
      if ~ischar(tline)
          break
      end
      nums = regexp(tline,'\d+','match'); %get number from string
      if length(nums)
          if l==1
              l=0;
              A(k,2)=str2num(nums{1});  
              k=k+1;
              continue;
          end
          A(k,1)=str2num(nums{1});
          l=1;
      else
          l=0;
          continue;
      end
end
G=[]; 
for i=1:length(A) 
    G(A(i,1),A(i,2)) = 1; %G = 1if the vertex pair exists in A
    G(A(i,2),A(i,1)) = 1; %G = 1if the vertex pair exists in A
end
%End of adjacency matrix computation

%This calcualtes the row sum to find the degree
rowsum = [];
rower = 0;
for i=1:length(G)
    for j=1:length(G)
        rower = rower + G(i,j);
    end
    rowsum(i) = rower;
    rower = 0;
end        
%End of degree calculations

%Finds the node with highest degree
degree_max = 0;
for i=1:length(rowsum)
    if rowsum(i)>degree_max
        degree = rowsum(i);
        node = i;
    end
end    

%Max degree vertex is 'node' and the degree is degree_max

%Finds the vertices connected to the node
connected = [];
for i=1:length(G)
    if G(node,i) == 1
        connected(end+1) = i;
    end
end

%vertices connected to the node is in the matrix 'connected'

nodes = connected;
nodes(end+1) = node; %set of nodes in subgraph is now in matrix nodes
subgraph = [];
for i=1:length(nodes)
    for j=1:length(nodes)
        if G(nodes(i), nodes(j)) == 1
            subgraph(nodes(i), nodes(j)) = 1; %if there is an edge connecting 
                                              %the nodes in the graph then 
                                              %the subgraph will also have the edges 
        else
            subgraph(nodes(i), nodes(j)) = 0;
        end
    end
end

%the subgraph is in subgraph

%Calculate the Global clustering coeffecient
cluster_rowsum = [];
rower = 0;
for i=1:length(subgraph)
    for j=1:length(subgraph)
        rower = rower + subgraph(i,j);
    end
    cluster_rowsum(i) = rower;
    rower = 0;
end 

dci = [];
for i=1:length(cluster_rowsum)
    if cluster_rowsum(i) > 0
        fact = prod(1:cluster_rowsum(i));
        j = cluster_rowsum(i) - 2;
        fact_den = prod(1:j);
        if fact/(2*fact_den) < 1
            dci(end+1) = 0;
        else    
            dci(end+1) = fact/(2*fact_den);
        end
    else
        dci(end+1) = 0;
    end
end

%dci is the (dc1 2)term in the clustering coeff formula

%finds sigma sigma ajk
sum =0;
 for i=1:length(subgraph)
     for j=1:length(subgraph)
         for k=1:length(subgraph)
             if j<k
                if subgraph(i,j) == 1
                     if subgraph(i,k) == 1
                         sum = sum + subgraph(j,k);
                     end
                end
             end   
         end                
     end
 end
 
 sumdci = 0;
for i=1:length(dci)
    sumdci = sumdci + dci(i);
end

glob_clust = sum/sumdci;

%glob_clust = global clustring coeffecient



        
    
            

    
    









