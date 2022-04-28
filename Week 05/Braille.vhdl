LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Braille is
    port  (
        A, B, C, D: in std_logic;
        T, U, V, W, X, Y: out std_logic
    );
end Braille;

architecture Equations of Braille is
    begin   
        -- concurrent assignment statements
        T <= not A or B or C;
        U <= (not A and B and C) or (A and not B and not C) or (not A and not C and D) or (A and C and D);
        V <= (A and C) or (A and B);
        W <= (not A and not B and C) or (not A and C and not D) or (A and not C) or (A and B and D) or (B and not C and D);
        X <= (not A and C and D) or (not A and B and not D) or (A and not C and D) or (B and C and not D);
        Y <= 'Z'; -- '0' works as well
    end Equations;