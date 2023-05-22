library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
    port(
        x, y, cin, clk: in std_logic;
        sum, cout: out std_logic
    );
end entity;

architecture Behavioral of FullAdder is
    signal sum_temp, cout_temp: std_logic;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            sum_temp <= x xor y xor cin;
            cout_temp <= (x and y) or (cin and (x xor y));
        end if;
    end process;

    sum <= sum_temp;
    cout <= cout_temp;
end architecture;
