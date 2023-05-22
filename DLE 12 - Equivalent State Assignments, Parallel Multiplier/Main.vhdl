LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Main is
    port(
        Load, Sh, Ad, CLK: in std_logic;
        Multiplyer, Multiplicand: in std_logic_vector(3 downto 0);
        Show: out std_logic_vector(8 downto 0)
    );
end Main;

architecture Behavior of Main is
    component RAMRegister9Bit
        port(
            D: in std_logic_vector(8 downto 0);
            Load, Sh, Ad: in std_logic;
            CLK: in std_logic;
            DO: out std_logic_vector(8 downto 0);
            M: out std_logic
        );
    end component;

    component FullAdder4Bit
        port (
            A, B : in std_logic_vector(3 downto 0);
            S : OUT std_logic_vector(4 downto 0);
            C4: OUT std_logic
        );
    end component;
    
    signal tmp_Multiplicand, tmp_B, tmp_sum: std_logic_vector(3 downto 0) := "0000";
    signal tmp_C4, tmp_M: std_logic;
    signal tmp_DO: std_logic_vector(8 downto 0) := "000000000";
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            RAM: RAMRegister9Bit port map(
                tmp_C4&tmp_Multiplicand&Multiplyer, Load, Sh, Ad, 
                CLK, tmp_DO, tmp_M);
            FA: FullAdder4Bit port map(Multiplicand, tmp_B, tmp_sum, tmp_C4);



    



------------------ RAM ------------------ 
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

------------------ Full Adder ------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY FullAdder4Bit IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        S : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
        C4: OUT STD_LOGIC
    );
END FullAdder4Bit;

ARCHITECTURE Equations OF FullAdder4Bit IS
    SIGNAL A_int, B_int, results : INTEGER := 0;
BEGIN
    A_int <= to_integer(signed(A));
    B_int <= to_integer(signed(B));
    results <= A_int + B_int;
    S <= STD_LOGIC_VECTOR(to_signed(results, 5));
    C4 <= S(4);
END Equations;