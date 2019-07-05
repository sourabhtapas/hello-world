----------------------------------------------------------------------------------
-- Create Date                       : 04/08/2016 12:23:28 PM
-- Module Name                       : hw_dpc_env
-- Description                       : Hardware Testing Enviorment for "Digital Pulse Compression Block (DPC)"
-- company                           : Airbus Group India Pvt.Ltd
-- Engineer                          : Vishal Goyal, Sourabh Tapas
-- Development Platform              : Vivado 2016.1
-- Testing and Verification Platform : Vivado 2016.1
----------------------------------------------------------------------------------

library ieee;
library unisim;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
use unisim.vcomponents.all;
use work.all; 
use work.mydatatype_pkg.all;                               -- To load P2 code and P4 code coefficients


entity hw_dpc_env is
port( hw_clk_pin_p : in  std_logic;                       -- primary system clock input
      hw_clk_pin_n : in  std_logic;                       -- - LVDS
      hw_rst       : in  std_logic;                       -- active high reset - synchronous to clock
      hw_outImain  : out std_logic_vector (15 downto 0);  -- Output correspoding to Inphase part of Main channel
      hw_outQmain  : out std_logic_vector (15 downto 0);  -- Output correspoding to Quadraturephase part of Main channel
      hw_outIaux   : out std_logic_vector (15 downto 0);  -- Output correspoding to Inphase part of Auxilary channel
      hw_outQaux   : out std_logic_vector (15 downto 0)); -- Output correspoding to Quadraturephase part of Auxilary channel
end hw_dpc_env;


architecture Behavioral of hw_dpc_env is

signal clk5_s, clk30_s, locked_s, not_rst                     : std_logic;                       -- 5 MHz clock, 30 MHz clock, locked signal of clock wizard and inverted reset signal for enabling BROMs respectively
signal cnt395                                                 : integer range 0 to 512 := 0;     -- counter for pointing to 395 different addresses, where the main channel and auxillary channel input test vectors are stored for P2 codes and P4 codes
signal cnt395_slv                                             : std_logic_vector (8  downto 0);  -- to store standard logic vector data type of above counter signal
signal I_main_s, Q_main_s, I_aux_s, Q_aux_s                   : std_logic_vector (15 downto 0);  -- main and auxilary channel input signals
signal Im_P2, Qm_P2, Ia_P2, Qa_P2                             : std_logic_vector (15 downto 0);  -- main and auxilary channel input signals for P2 codes


--component Declaration of DPC module

component DPC_module 
Port ( dpc_clk_in_p    : in  std_logic;                        -- primary system clock input
       dpc_clk_in_n    : in  std_logic;                        -- - LVDS
       clk5            : out std_logic;                        -- 5 MHz clock
       clk30           : out std_logic;                        -- 30 MHz clock
       locked          : out std_logic;                        -- locked of clk wizard
       rst             : in  std_logic;                        -- active high reset - synchronous to clock
       I_main          : in  std_logic_vector (15 downto 0);   -- Input I_main correspoding to Inphase part of Main channel
       Q_main          : in  std_logic_vector (15 downto 0);   -- Input Q_main correspoding to Quadraturephase part of Main channel
       I_aux           : in  std_logic_vector (15 downto 0);   -- Input I_aux correspoding to Inphase part of Auxilary channel
       Q_aux           : in  std_logic_vector (15 downto 0);   -- Input Q_aux correspoding to Quadraturephase part of Auxilary channel
       dpcOut_Imain16  : out std_logic_vector (15 downto 0);   -- Output correspoding to Inphase part of Main channel
       dpcOut_Qmain16  : out std_logic_vector (15 downto 0);   -- Output correspoding to Quadraturephase part of Main channel
       dpcOut_Iaux16   : out std_logic_vector (15 downto 0);   -- Output correspoding to Inphase part of Auxilary channel
       dpcOut_Qaux16   : out std_logic_vector (15 downto 0));  -- Output correspoding to Quadraturephase part of Auxilary channel
end component;


-- Block ROM (BROM) component Declarations - generated by the Block Memory Generator IP, initailised with input test vectors of P2 code and P4 code

component BROM_512X16_Im
port ( clka  : in  std_logic;
       ena   : in  std_logic;
       addra : in  std_logic_vector(8 downto 0);
       douta : out std_logic_vector(15 downto 0));
end component;

component BROM_512X16_Qm
port ( clka  : in  std_logic;
       ena   : in  std_logic;
       addra : in  std_logic_vector(8 downto 0);
       douta : out std_logic_vector(15 downto 0));
end component;

component BROM_512X16_Ia
port ( clka  : in  std_logic;
       ena   : in  std_logic;
       addra : in  std_logic_vector(8 downto 0);
       douta : out std_logic_vector(15 downto 0));
end component;

component BROM_512X16_Qa
port ( clka  : in  std_logic;
       ena   : in  std_logic;
       addra : in  std_logic_vector(8 downto 0);
       douta : out std_logic_vector(15 downto 0));
end component;

begin

not_rst <= not hw_rst;                          -- generating enable signal to activate BROMs when reset is zero (low)


-- instantiation of BROMs for P2 code

BROM_Im_P2: BROM_512X16_Im port map (clka => clk5_s, ena => not_rst, addra => cnt395_slv, douta => Im_P2);
BROM_Qm_P2: BROM_512X16_Qm port map (clka => clk5_s, ena => not_rst, addra => cnt395_slv, douta => Qm_P2);
BROM_Ia_P2: BROM_512X16_Ia port map (clka => clk5_s, ena => not_rst, addra => cnt395_slv, douta => Ia_P2);
BROM_Qa_P2: BROM_512X16_Qa port map (clka => clk5_s, ena => not_rst, addra => cnt395_slv, douta => Qa_P2);



--  P2 code as input test vectors


    I_main_s <= Im_P2;
    Q_main_s <= Qm_P2;
    I_aux_s <= Ia_P2;            
    Q_aux_s <= Qa_P2;
    
-- instantiation of DPC module

DPC : DPC_module
port map ( dpc_clk_in_p   => hw_clk_pin_p,
           dpc_clk_in_n   => hw_clk_pin_n,
           clk5           => clk5_s, 
           clk30          => clk30_s, 
           locked         => locked_s, 
           rst            => hw_rst,
           I_main         => I_main_s,
           Q_main         => Q_main_s,
           I_aux          => I_aux_s,
           Q_aux          => Q_aux_s,
           dpcOut_Imain16 => hw_outImain,
           dpcOut_Qmain16 => hw_outQmain,
           dpcOut_Iaux16  => hw_outIaux, 
           dpcOut_Qaux16  => hw_outQaux);


-- Free running Decimal 395 counter for BROM address locations
 
Address_395: process(clk5_s)
begin
    if rising_edge(clk5_s) then           -- synchronous event test
        if(hw_rst = '1') then             -- active high reset - synchronous to clock      Note: This reset is without inclusion of metaharden logic.
            cnt395 <= 0;                  -- reset the counter
            else                          -- non-reset behavior
                if (cnt395  < 395) then   -- Is 395th count reached?
                    cnt395 <= cnt395 + 1; -- No, then increment count by 1
                else                      -- yes, 
                    cnt395 <= 0;          -- then reset the counter value to zero
                end if;                   -- end of counter condition
        end if;                           -- end of reset/normal operation
    end if;                               -- end of synchronous events
end process Address_395; 

cnt395_slv <= std_logic_vector(to_unsigned(cnt395,cnt395_slv'length));   -- converting decimal count to standard logic vector data type

end Behavioral;