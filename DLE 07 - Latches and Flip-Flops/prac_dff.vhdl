LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity cyclicSR is
    port(
        clk: in std_logic;
        Qout: out std_logic_vector(1 to 3)
    );
end cyclicSR;

architecture cyclicSR3 of cyclicSR is
    component my_DFF
        port (
            D, clk: in std_logic;
            Q: out std_logic
        );
    end component;

    signal Q1, Q2, Q3: std_logic;

    begin
        FF1: my_DFF port map(Q3, clk, Q1);
        FF2: my_DFF port map(Q1, clk, Q2);
        FF3: my_DFF port map(Q2, clk, Q3);
        Qout <= Q1 & Q2 & Q3;
end cyclicSR3;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity my_DFF is
    port (
        D, clk: in std_logic;
        Q: out std_logic
    );
end my_DFF;

architecture DFF_simple of my_DFF is
begin
    process (clk)
    begin
        if clk'event and clk = '1' then
            Q <= D after 5 ns;
        end if;
    end process;
end DFF_simple;
