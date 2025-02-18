```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity my_entity is
    port (
        clk : in std_logic;
        rst : in std_logic;
        data_in : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavioral of my_entity is
    signal internal_reg : std_logic_vector(7 downto 0) := (others => '0'); -- Correct initialization
begin
    process (clk, rst)
    begin
        if rst = '1' then
            internal_reg <= (others => '0');
        elsif rising_edge(clk) then
            internal_reg <= data_in;
            data_out <= internal_reg;
        end if;
    end process;
end architecture;
```