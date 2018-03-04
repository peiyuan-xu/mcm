function CarEndCunI = noteCarEndCun(CarEndCunI,CarCunI )
      index=find(CarEndCunI<0);
      index=index(1);
      CarEndCunI(index)=CarCunI;


end

