LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity ASM4 is
    port(
        A, B: in std_logic_vector(3 downto 0);
        F: in std_logic_vector(1 downto 0);
        S: out std_logic_vector(7 downto 0)
    );
end ASM4;

architecture Equations of ASM4 is
    signal results: integer := 0;
    begin
        with F select
        results <= 
            to_integer(signed(A)) + to_integer(signed(B)) when "00",
            to_integer(signed(A)) - to_integer(signed(B)) when "01",
            to_integer(signed(A)) * to_integer(signed(B)) when "10",
            0 when others;
        S <= std_logic_vector(to_signed(results, 8));
end Equations;