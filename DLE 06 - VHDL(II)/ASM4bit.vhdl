-- ASM4 stands for Adder-Subtracter-Multiplyer 4 bits

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity ASM4 is
    port(
        A, B: in std_logic_vector(3 downto 0);
        F: in std_logic_vector(1 downto 0); -- Function selecting
        S: out std_logic_vector(7 downto 0)
    );
end ASM4;

architecture Equations of ASM4 is
    signal A_int, B_int, results: integer := 0;
    begin
        A_int <= to_integer(unsigned(A));
        B_int <= to_integer(unsigned(A));
        with F select
        results <= 
            A_int + B_int when "00",
            A_int - B_int when "01",
            A_int * B_int when "10",
            0 when others;
        S <= std_logic_vector(to_unsigned(results, 8));
end Equations;