program test1;
var
    a : boolean = 3 < 4 and not False or False;
    b : real = -sqrt(9.0);
    c : real = exp(3.0);
    d : boolean = b < c;
    z : real = 4.0;
    nothing : real;

function multBy3(x : real) : real;
var
    y : real = 3.0;
begin
    multBy3 := x * y;    
end;

begin
    z := multBy3(z+1);
    writeln('Yo');
    writeln(not a);
    writeln(z);
    writeln(z-b+3.0);
    writeln(z/2);
    writeln(d);
    writeln(nothing);
end.