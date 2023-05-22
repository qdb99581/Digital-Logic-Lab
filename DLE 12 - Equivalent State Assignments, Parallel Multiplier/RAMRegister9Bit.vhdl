LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RAMRegister9Bit is
    port(
        D: in std_logic_vector(8 downto 0);
        Load, Sh, Ad: in std_logic;
        CLK: in std_logic;
        DO: out std_logic_vector(8 downto 0);
        M: out std_logic
    );
end RAMRegister9Bit;

architecture Behavior of RAMRegister9Bit is
    signal SRAM_internal: std_logic_vector(8 downto 0) := ("000000000");

    begin
        process (CLK)
        begin
            DO <= SRAM_internal;
            M <= DO(0);
            if rising_edge(CLK) then
                -- Write memory
                SRAM_internal <= D when Load = '1';

                if Sh then
                    SRAM_internal <= SRAM_internal srl 1;
                end if;
            end if;
        end process;

    end Behavior;