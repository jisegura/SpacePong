
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity vga_sync is
   port(
      pxl_clk, reset: in std_logic;
      hsync, vsync: out std_logic;
      active: out std_logic;
      pixel_x, pixel_y: out std_logic_vector (11 downto 0)
    );
end vga_sync;

architecture arch of vga_sync is

--***1280x1024@60Hz***-- Requires 108 MHz clock
constant FRAME_WIDTH : natural := 1280;
constant FRAME_HEIGHT : natural := 1024;
constant H_FP : natural := 48; --H front porch width (pixels)
constant H_PW : natural := 112; --H sync pulse width (pixels)
constant H_MAX : natural := 1688; --H total period (pixels)
constant V_FP : natural := 1; --V front porch width (lines)
constant V_PW : natural := 3; --V sync pulse width (lines)
constant V_MAX : natural := 1066; --V total period (lines)
constant H_POL : std_logic := '1';
constant V_POL : std_logic := '1';

signal h_cntr_reg : std_logic_vector(11 downto 0) := (others =>'0');
signal v_cntr_reg : std_logic_vector(11 downto 0) := (others =>'0');

signal h_sync_reg : std_logic := not(H_POL);
signal v_sync_reg : std_logic := not(V_POL);

signal h_sync_dly_reg : std_logic := not(H_POL);
signal v_sync_dly_reg : std_logic :=  not(V_POL);


begin
 process (pxl_clk)
 begin
   if (rising_edge(pxl_clk)) then
     if (h_cntr_reg = (H_MAX - 1)) then
       h_cntr_reg <= (others =>'0');
     else
       h_cntr_reg <= h_cntr_reg + 1;
     end if;
   end if;
 end process;
 
 process (pxl_clk)
 begin
   if (rising_edge(pxl_clk)) then
     if ((h_cntr_reg = (H_MAX - 1)) and (v_cntr_reg = (V_MAX - 1))) then
       v_cntr_reg <= (others =>'0');
     elsif (h_cntr_reg = (H_MAX - 1)) then
       v_cntr_reg <= v_cntr_reg + 1;
     end if;
   end if;
 end process;
 
 process (pxl_clk)
 begin
   if (rising_edge(pxl_clk)) then
     if (h_cntr_reg >= (H_FP + FRAME_WIDTH - 1)) and (h_cntr_reg < (H_FP + FRAME_WIDTH + H_PW - 1)) then
       hsync <= H_POL;
     else
       hsync <= not(H_POL);
     end if;
   end if;
 end process;
 
 
 process (pxl_clk)
 begin
   if (rising_edge(pxl_clk)) then
     if (v_cntr_reg >= (V_FP + FRAME_HEIGHT - 1)) and (v_cntr_reg < (V_FP + FRAME_HEIGHT + V_PW - 1)) then
       vsync <= V_POL;
     else
       vsync <= not(V_POL);
     end if;
   end if;
 end process;
 
 
 active <= '1' when ((h_cntr_reg < FRAME_WIDTH) and (v_cntr_reg < FRAME_HEIGHT))else
           '0';
 
 pixel_x <= h_cntr_reg; 
 pixel_y <= v_cntr_reg;           
  
   
end arch;
