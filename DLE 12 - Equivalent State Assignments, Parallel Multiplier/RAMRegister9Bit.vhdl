LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RAMRegister9Bit is
    port(
        D: in std_logic_vector(8 downto 0);
        Load, Sh, Ad: in std_logic;
        CLK: in std_logic;
        DO: out std_logic_vector(8 downto 0)
    );
end RAMRegister9Bit;

architecture Behavior of RAMRegister9Bit is
    signal SRAM_internal: std_logic_vector(8 downto 0) := ("000000000");

    begin
        DO <= SRAM_internal;

        -- Write memory
        SRAM_internal <= D when Load = '1';

    end Behavior;