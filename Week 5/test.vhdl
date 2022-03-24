LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity FullAdder is
    port  (
        X, Y, Cin: in std_logic;
        Sum, Cout: out std_logic
    );
end FullAdder;

architecture Equations of FullAdder is
    begin   
        -- concurrent assignment statements
        Sum <= X xor Y xor Cin;
        Cout <= (X and Y) or (X and Cin) or (Y and Cin);
    end Equations;