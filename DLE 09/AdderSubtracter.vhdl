LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity AdderSubber is
    port  (
        A, B, Cin, Sub: in std_logic;
        Cout, Sum: out std_logic
    );
end AdderSubber;

architecture Equations of AdderSubber is
    begin   
        -- concurrent assignment statements
        Cout <= (A and B and not Sub) or (A and Cin and not Sub) or (not A and B and Sub) or (not A and Cin and Sub) or (B and Cin);
        Sum <= (not A and B and not Cin) or (A and not B and not Cin) or (not A and not B and Cin) or (A and B and Cin);
    end Equations;