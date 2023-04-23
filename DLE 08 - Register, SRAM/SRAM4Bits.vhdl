LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity SRAM4bits is
    port(
        D: in std_logic_vector(3 downto 0);
        Address: in std_logic_vector(1 downto 0);
        ChipSelect, WE, OE: in std_logic;
        DO: out std_logic_vector(3 downto 0)
    );
end SRAM4bits;

architecture Behavior of SRAM4bits is
    type memory is array(3 downto 0) of std_logic_vector(3 downto 0);
    signal SRAM_internal: memory := ("0000", "0000", "0000", "0000");
    signal Address_int: integer;
    signal Address_temp: std_logic_vector(3 downto 0);

    begin
        Address_temp <= "00" & Address;
        Address_int <= to_integer(unsigned(Address_temp));

        -- Read memory
        DO <= "ZZZZ" when ChipSelect = '0'
        else "ZZZZ" when OE = '0'
        else SRAM_internal(Address_int) when OE = '1';

        -- Write memory
        SRAM_internal(Address_int) <= D when WE = '1';

    end Behavior;
    