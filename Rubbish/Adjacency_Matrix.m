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