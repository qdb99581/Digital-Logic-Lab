LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity my_SRAM is
    port(
        D: in std_logic_vector(3 downto 0);
        Address: in std_logic_vector(1 downto 0);
        ChipSelect, WE, OE: in std_logic;
        DO: out std_logic_vector(3 downto 0)
    );
end my_SRAM;

architecture SRAM_four of my_SRAM is
    type memory is array(3 downto 0) of std_logic_vector(3 downto 0);
    signal SRAM_internal: memory := ("0011", "0010", "0001", "0000");
    signal Address_int: integer;
    signal Address_temp: std_logic_vector(3 downto 0);

    begin
        Address_temp <= "00" & Address;
        Address_int <= to_integer(unsigned(Address_temp));

        DO <= "ZZZZ" when ChipSelect = '0'
        else "ZZZZ" when OE = '0'
        else SRAM_internal(Address_int) when OE = '1';

        SRAM_internal(Address_int) <= D when WE = '1';

    end SRAM_four;
    