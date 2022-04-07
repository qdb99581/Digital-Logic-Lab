LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity AddSubMulter is
    port(
        A, B: in std_logic_vector(3 downto 0);
        F: in std_logic_vector(1 downto 0); -- Select
        S: out std_logic_vector(7 downto 0)
    );
end AddSubMulter;

architecture Structure of AddSubMulter is
    signal A_int, B_int, S_int: integer := 0;
    signal output: std_logic_vector(7 downto 0);

begin
    A_int <= 
        to_integer(unsigned(A)) when F = "00" else
        to_integer(signed(A)) when F = "01" else
        to_integer(signed(A)) when F = "10";

    B_int <= 
        to_integer(unsigned(B)) when F = "00" else
        to_integer(signed(B)) when F = "01" else
        to_integer(signed(B)) when F = "10";

    S_int <= 
        A_int + B_int when F = "00" else
        A_int - B_int when F = "01" else
        A_int * B_int when F = "10";

    output <= 
        std_logic_vector(to_unsigned(S_int, 8)) when F = "00" else
        std_logic_vector(to_signed(S_int, 8)) when F = "01" else
        std_logic_vector(to_signed(S_int, 8)) when F = "10";

    S <= output(7 downto 0);
        
end Structure;