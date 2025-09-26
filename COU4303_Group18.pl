% Path Cost  = Distance Cost +  Traffic Cost + Weather Cost + Obstacle Cost + Road Cond Cost 
% 		

% Total Cost  = Path Cost + Vehicle Cost 


vehicle(bike,b).
vehicle(car,c).
vehicle(_,wrong).



roadtype(f,n,highway).
roadtype(n,f,highway).
roadtype(k,m,highway).
roadtype(m,k,highway).
roadtype(n,m,highway).
roadtype(m,n,highway).
roadtype(n,t,highway).
roadtype(t,n,highway).
roadtype(t,y,highway).
roadtype(y,t,highway).
roadtype(y,q,highway).
roadtype(q,y,highway).
roadtype(y,s,highway).
roadtype(s,y,highway).
roadtype(s,h,highway).
roadtype(h,s,highway).
roadtype(y,x,highway).
roadtype(x,y,highway).
roadtype(x,d,highway).
roadtype(d,x,highway).


weathertype(a,j,heavyrain, 12).
weathertype(j,a,heavyrain, 12).
weathertype(t,z,heavyrain, 12).
weathertype(z,t,heavyrain, 12).
weathertype(d,h,heavyrain, 8).
weathertype(h,d,heavyrain, 8).


traffictype(i,j,heavytraffic, 9).
traffictype(j,i,heavytraffic, 9).
traffictype(j,k,heavytraffic, 6).
traffictype(k,j,heavytraffic, 6).
traffictype(f,g,heavytraffic, 12).
traffictype(g,f,heavytraffic, 12).
traffictype(b,g,heavytraffic, 12).
traffictype(g,b,heavytraffic, 12).
traffictype(o,n,heavytraffic, 10).
traffictype(n,o,heavytraffic, 10).
traffictype(d,g,heavytraffic, 12).
traffictype(g,d,heavytraffic, 12).
traffictype(d,e,heavytraffic, 6).
traffictype(e,d,heavytraffic, 6).


road(a,i,7,43).
road(i,a,7,43).
road(a,j,6,46).
road(j,a,6,46).
road(a,f,4,2020).
road(f,a,4,2020).
road(a,b,5,29).
road(b,a,5,29).
road(b,f,4,24).
road(f,b,4,24).
road(b,g,4,32).
road(g,b,4,32).
road(b,c,4,24).
road(c,b,4,24).
road(c,g,4,26).
road(g,c,4,26).
road(c,d,5,29).
road(d,c,5,29).
road(d,g,6,40).
road(g,d,6,40).
road(d,w,6,66).
road(w,d,6,66).
road(d,x,3,18).
road(x,d,3,18).
road(d,h,6,56).
road(h,d,6,56).
road(d,e,4,30).
road(e,d,4,30).
road(e,h,5,45).
road(h,e,5,45).
road(f,u,3,27).
road(u,f,3,27).
road(f,n,7,60).
road(n,f,7,60).
road(f,g,4,36).
road(g,f,4,36).
road(g,v,2,12).
road(v,g,2,12).
road(g,w,3,21).
road(w,g,3,21).
road(x,y,3,15).
road(y,x,3,15).
road(x,s,4,20).
road(s,x,4,20).
road(h,s,4,20).
road(s,h,4,20).
road(h,r,5,32).
road(r,h,5,32).
road(h,p,6,32).
road(p,h,6,32).
road(i,k,4,24).
road(k,i,4,24).
road(i,j,3,24).
road(j,i,3,24).
road(j,u,2,10).
road(u,j,2,10).
road(j,k,4,26).
road(k,j,4,26).
road(u,l,3,23).
road(l,u,3,23).
road(v,n,4,40).
road(n,v,4,40).
road(v,t,3,23).
road(t,v,3,23).
road(w,y,2,10).
road(y,w,2,10).
road(l,m,2,10).
road(m,l,2,10).
road(n,m,3,21).
road(m,n,3,21).
road(n,t,3,21).
road(t,n,3,21).
road(n,o,5,40).
road(o,n,5,40).
road(k,m,2,10).
road(m,k,2,10).
road(k,o,8,56).
road(o,k,8,56).
road(t,z,4,32).
road(z,t,4,32).
road(t,y,4,20).
road(y,t,4,20).
road(y,z,3,15).
road(z,y,3,15).
road(y,q,3,15).
road(q,y,3,15).
road(y,s,4,20).
road(s,y,4,20).
road(s,q,4,26).
road(q,s,4,26).
road(z,o,2,10).
road(o,z,2,10).
road(q,o,4,26).
road(o,q,4,26).
road(q,r,3,21).
road(r,q,3,21).
road(r,p,3,2018).
road(p,r,3,2018).
road(p,o,8,40).
road(o,p,8,40).


print_list([]).
print_list([H|T]) :- write(H),write(','),print_list(T). 




start :-
    write('Enter Starting Point (e.g., a.) :'),
    read(X),
    write('Enter Destination (e.g., g.) :'),
    read(Y),
    write('Enter Vehicle (e.g., car.) :'),
    read(Z),
    vehicle(Z, VehicleCost),
    write('Calculating path. This will take a few moments..........'),nl,
	calculator(X,Y,Z,VehicleCost).
	
    





calculator(X, Y, Z, VehicleCost) :-
    find_lowest_cost_path(X, Y, VehicleCost, LowestCost, LowestDist, LowestPath),
    nl,
    write('Lowest Cost Amount is : '), write(LowestCost), nl,
    write('Lowest Path is : '), write(LowestPath), nl,
    write('Total Distance is : '), write(LowestDist), write(' KMs'), nl,
    (   vehicle(Z, b)
        ->  write('The best available route for a bike has been selected based on factors such as Weather, Traffic, Road type, obstacles and Distance. '), nl,write('Routes which include Less Traffic, clean Weather and good Road Conditions are priorotized while routes with Heavy Rain, Highways and Road blocks have been depriorotized or ignored. '),nl,
            write('The best path is '), print_list(LowestPath),write(' with a distance of '), write(LowestDist), write(' KMs')
    ;   vehicle(Z, c)
        ->  write('The best available route for a car has been selected based on factors such as Weather, Traffic, Road type, obstacles and Distance. '), nl,write('Routes which include Less Traffic, clean Weather, good Road Conditions and Highways are priorotized while routes with Heavy Traffic and 
Road blocks have been depriorotized or ignored. '),nl,
            write('The best path is '), print_list(LowestPath),write(' with a distance of '), write(LowestDist), write(' KMs')
    
    ).



calculator(_,_,_,_) :-   vehicle(_,wrong), write('There is an invalid entry in the input. Please check and try again').









find_lowest_cost_path(Start, End, VehicleCost, LowestCost, LowestDist, LowestPath) :-
    % Collects Cost and Distance as a single term to sort by cost
    findall(FinalCost-(Dist-Path) , path_counter(Start, End, VehicleCost, Dist, FinalCost, Path, [Start]) , AllSolutions),
    % Check if any paths were found before sorting
    AllSolutions \= [],
    sort(AllSolutions, SortedPaths),
    % Extract the first element (the one with the lowest cost)
    [LowestCost-(LowestDist-LowestPath)|_] = SortedPaths.
	


path_counter(Start, End, c, TotalDist, TotalCost, [Start,End], Visited) :-
    road(Start, End, Dist, PathCost),
	\+ member(End, Visited),
    TotalDist is Dist,
    (   roadtype(Start, End, highway)
    ->  TotalCost is PathCost
    ;   traffictype(Start, End, heavytraffic, TrafficCost)
    ->  TotalCost is PathCost + (TrafficCost*3)
    ;   TotalCost is PathCost
    ).

path_counter(Start, End, b, TotalDist, TotalCost, [Start,End], Visited) :-
    road(Start, End, Dist, PathCost),
	\+ member(End, Visited),
    TotalDist is Dist,
    (   roadtype(Start, End, highway)
    ->  TotalCost is PathCost + 1000
    ;   weathertype(Start, End, heavyrain, RainCost)
    ->  TotalCost is PathCost + (RainCost*5)
    ;   TotalCost is PathCost
    ).


path_counter(Start, End, c, TotalDist, TotalCost, [Start|RestPath], Visited) :-
    road(Start, Next, Dist1, Cost1),
    (\+ member(Next, Visited)
    ->	path_counter(Next, End, c, Dist2, Cost2, RestPath, [Next|Visited]),
    	TotalDist is Dist1 + Dist2,
	(  roadtype(Start, Next, highway)
    	-> TotalCost is Cost1 + Cost2
    	;  traffictype(Start, Next, heavytraffic, TrafficCost)
	-> TotalCost is Cost1 + Cost2 + (TrafficCost*3)
	;  TotalCost is Cost1 + Cost2
    	)
     ).	
	
path_counter(Start, End, b, TotalDist, TotalCost, [Start|RestPath], Visited) :-
    road(Start, Next, Dist1, Cost1),
    (\+ member(Next, Visited)
    ->	path_counter(Next, End, b, Dist2, Cost2, RestPath, [Next|Visited]),
    TotalDist is Dist1 + Dist2,
    	(  roadtype(Start, Next, highway)
    	-> TotalCost is Cost1 + 1000 + Cost2
    	;  weathertype(Start, Next, heavyrain, RainCost)
	-> TotalCost is Cost1 + Cost2 + (RainCost*5)
	;  TotalCost is Cost1 + Cost2
    	)
    ).



						 
		




		
