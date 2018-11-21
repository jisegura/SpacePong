----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2018 11:03:25 AM
-- Design Name: 
-- Module Name: game_mech - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity space_pong is
    Port (
        led_pins: out std_logic_vector(3 downto 0); 
        btn_push: in std_logic_vector(1 downto 0);
        vga_hs: out std_logic;
        vga_vs: out std_logic;
        vga_r: out std_logic_vector(4 downto 0);
        vga_b: out std_logic_vector(4 downto 0);
        vga_g: out std_logic_vector(5 downto 0); 
        rst_pin: in std_logic;
        str_pin: in std_logic;
        clk_pin: in std_logic
    );
end space_pong;

architecture Behavioral of space_pong is

component clk_vga
port
 (-- Clock in ports
  CLK_IN1: in std_logic;
  -- Clock out ports
  CLK_OUT1: out std_logic
 );
end component;

component vga_sync
   port(
      pxl_clk, reset: in std_logic;
      hsync, vsync: out std_logic;
      active: out std_logic;
      pixel_x, pixel_y: out std_logic_vector (11 downto 0)
    );
end component;

component hit_box
    port (
        ball_x_pos: in natural;
        ball_y_pos: in natural;
        ball_w: in natural;
        ball_h: in natural;
        ball_x_dir: in std_logic;
        ball_y_dir: in std_logic;
        enemy_x_pos: in natural;
        enemy_y_pos: in natural;
        enemy_w: in natural;
        enemy_h: in natural;
        hit_top: out std_logic;
        hit_right: out std_logic;
        hit_bottom: out std_logic;
        hit_left: out std_logic
    );
end component;

component color_pattern
    port (
        pixel_x: in std_logic_vector(11 downto 0);
        pixel_y: in std_logic_vector(11 downto 0);
        active: in std_logic;
        
        player_x_pos: in natural;
        player_y_pos: in natural;
        player_w: in natural;
        player_h: in natural;
        
        ball_x_pos: in natural;
        ball_y_pos: in natural;
        ball_w: in natural;
        ball_h: in natural;
        
        enemy10_x_pos: in natural;
        enemy10_y_pos: in natural;
        enemy10_life: in std_logic_vector(1 downto 0);
        enemy11_x_pos: in natural;
        enemy11_y_pos: in natural;
        enemy11_life: in std_logic_vector(1 downto 0);
        enemy12_x_pos: in natural;
        enemy12_y_pos: in natural;
        enemy12_life: in std_logic_vector(1 downto 0);
        enemy13_x_pos: in natural;
        enemy13_y_pos: in natural;
        enemy13_life: in std_logic_vector(1 downto 0);
        enemy20_x_pos: in natural;
        enemy20_y_pos: in natural;
        enemy20_life: in std_logic_vector(1 downto 0);
        enemy21_x_pos: in natural;
        enemy21_y_pos: in natural;
        enemy21_life: in std_logic_vector(1 downto 0);
        enemy22_x_pos: in natural;
        enemy22_y_pos: in natural;
        enemy22_life: in std_logic_vector(1 downto 0);
        enemy23_x_pos: in natural;
        enemy23_y_pos: in natural;
        enemy23_life: in std_logic_vector(1 downto 0);
        enemy30_x_pos: in natural;
        enemy30_y_pos: in natural;
        enemy30_life: in std_logic_vector(1 downto 0);
        enemy31_x_pos: in natural;
        enemy31_y_pos: in natural;
        enemy31_life: in std_logic_vector(1 downto 0);
        enemy32_x_pos: in natural;
        enemy32_y_pos: in natural;
        enemy32_life: in std_logic_vector(1 downto 0);
        enemy33_x_pos: in natural;
        enemy33_y_pos: in natural;
        enemy33_life: in std_logic_vector(1 downto 0);
        enemy40_x_pos: in natural;
        enemy40_y_pos: in natural;
        enemy40_life: in std_logic_vector(1 downto 0);
        enemy41_x_pos: in natural;
        enemy41_y_pos: in natural;
        enemy41_life: in std_logic_vector(1 downto 0);
        enemy42_x_pos: in natural;
        enemy42_y_pos: in natural;
        enemy42_life: in std_logic_vector(1 downto 0);
        enemy43_x_pos: in natural;
        enemy43_y_pos: in natural;
        enemy43_life: in std_logic_vector(1 downto 0);
        enemy50_x_pos: in natural;
        enemy50_y_pos: in natural;
        enemy50_life: in std_logic_vector(1 downto 0);
        enemy51_x_pos: in natural;
        enemy51_y_pos: in natural;
        enemy51_life: in std_logic_vector(1 downto 0);
        enemy52_x_pos: in natural;
        enemy52_y_pos: in natural;
        enemy52_life: in std_logic_vector(1 downto 0);
        enemy53_x_pos: in natural;
        enemy53_y_pos: in natural;
        enemy53_life: in std_logic_vector(1 downto 0);
        enemy60_x_pos: in natural;
        enemy60_y_pos: in natural;
        enemy60_life: in std_logic_vector(1 downto 0);
        enemy61_x_pos: in natural;
        enemy61_y_pos: in natural;
        enemy61_life: in std_logic_vector(1 downto 0);
        enemy62_x_pos: in natural;
        enemy62_y_pos: in natural;
        enemy62_life: in std_logic_vector(1 downto 0);
        enemy63_x_pos: in natural;
        enemy63_y_pos: in natural;
        enemy63_life: in std_logic_vector(1 downto 0);
        enemy_w: in natural;
        enemy_h: in natural;
        
        gamebox_x_pos: in natural;
        gamebox_y_pos: in natural;
        gamebox_w: in natural;
        gamebox_h: in natural;
        
        vga_red_out: out std_logic_vector(4 downto 0);
        vga_green_out: out std_logic_vector(5 downto 0);
        vga_blue_out: out std_logic_vector(4 downto 0)
    );
end component;

constant FRAME_WIDTH : natural := 1280;
constant FRAME_HEIGHT : natural := 1024;

-- Game Box
constant GAMEBOX_OFFSET: natural := 128;
constant GAMEBOX_PADDING: natural := 64;
constant GAMEBOX_WIDTH: natural := FRAME_WIDTH - (2 * GAMEBOX_OFFSET);
constant GAMEBOX_HEIGHT: natural := FRAME_HEIGHT - GAMEBOX_OFFSET;

-- Player Box
constant PLAYER_WIDTH: natural := 192;
constant PLAYER_HEIGHT: natural := 32;
constant PLAYER_X_INIT: natural := (GAMEBOX_WIDTH / 2) - (PLAYER_WIDTH / 2);
constant PLAYER_Y_INIT: natural := GAMEBOX_HEIGHT - GAMEBOX_PADDING - PLAYER_HEIGHT;
signal player_to_left: std_logic := '0';
signal player_to_right: std_logic := '0';
signal player_speed: std_logic;
signal player_position: natural := PLAYER_X_INIT;
signal player_hit_top: std_logic;
signal player_hit_right: std_logic;
signal player_hit_bottom: std_logic;
signal player_hit_left: std_logic;

-- Ball Box
constant BALL_WIDTH: natural := 24;
constant BALL_HEIGHT: natural := 24;
constant BALL_X_INIT: natural := (GAMEBOX_WIDTH / 2) - (BALL_WIDTH / 2);
constant BALL_Y_INIT: natural := PLAYER_Y_INIT - BALL_HEIGHT;
signal ball_x_dir: std_logic := '1';
signal ball_y_dir: std_logic := '0';
signal ball_speed: std_logic;
signal ball_active: std_logic := '0';
signal ball_x_position: natural := BALL_X_INIT;
signal ball_y_position: natural := BALL_Y_INIT;

-- Enemies Boxs
constant ENEMY_WIDTH: natural := 128;
constant ENEMY_HEIGHT: natural := 32;
constant ENEMY_MARGIN: natural := 48;
constant ENEMY_X_PADDING: natural := 88;
constant ENEMY_Y_PADDING: natural := 16;
constant ENEMY_X_INIT: natural := GAMEBOX_OFFSET + GAMEBOX_PADDING;
constant ENEMY_Y_INIT: natural := GAMEBOX_OFFSET + GAMEBOX_PADDING;
constant ENEMY_DEAD: std_logic_vector(1 downto 0) := "11";
signal enemy_dir: std_logic := '1';
signal enemy_speed: std_logic;

signal enemy10_hit_top: std_logic;
signal enemy10_hit_right: std_logic;
signal enemy10_hit_bottom: std_logic;
signal enemy10_hit_left: std_logic;
signal enemy11_hit_top: std_logic;
signal enemy11_hit_right: std_logic;
signal enemy11_hit_bottom: std_logic;
signal enemy11_hit_left: std_logic;
signal enemy12_hit_top: std_logic;
signal enemy12_hit_right: std_logic;
signal enemy12_hit_bottom: std_logic;
signal enemy12_hit_left: std_logic;
signal enemy13_hit_top: std_logic;
signal enemy13_hit_right: std_logic;
signal enemy13_hit_bottom: std_logic;
signal enemy13_hit_left: std_logic;

signal enemy20_hit_top: std_logic;
signal enemy20_hit_right: std_logic;
signal enemy20_hit_bottom: std_logic;
signal enemy20_hit_left: std_logic;
signal enemy21_hit_top: std_logic;
signal enemy21_hit_right: std_logic;
signal enemy21_hit_bottom: std_logic;
signal enemy21_hit_left: std_logic;
signal enemy22_hit_top: std_logic;
signal enemy22_hit_right: std_logic;
signal enemy22_hit_bottom: std_logic;
signal enemy22_hit_left: std_logic;
signal enemy23_hit_top: std_logic;
signal enemy23_hit_right: std_logic;
signal enemy23_hit_bottom: std_logic;
signal enemy23_hit_left: std_logic;

signal enemy30_hit_top: std_logic;
signal enemy30_hit_right: std_logic;
signal enemy30_hit_bottom: std_logic;
signal enemy30_hit_left: std_logic;
signal enemy31_hit_top: std_logic;
signal enemy31_hit_right: std_logic;
signal enemy31_hit_bottom: std_logic;
signal enemy31_hit_left: std_logic;
signal enemy32_hit_top: std_logic;
signal enemy32_hit_right: std_logic;
signal enemy32_hit_bottom: std_logic;
signal enemy32_hit_left: std_logic;
signal enemy33_hit_top: std_logic;
signal enemy33_hit_right: std_logic;
signal enemy33_hit_bottom: std_logic;
signal enemy33_hit_left: std_logic;

signal enemy40_hit_top: std_logic;
signal enemy40_hit_right: std_logic;
signal enemy40_hit_bottom: std_logic;
signal enemy40_hit_left: std_logic;
signal enemy41_hit_top: std_logic;
signal enemy41_hit_right: std_logic;
signal enemy41_hit_bottom: std_logic;
signal enemy41_hit_left: std_logic;
signal enemy42_hit_top: std_logic;
signal enemy42_hit_right: std_logic;
signal enemy42_hit_bottom: std_logic;
signal enemy42_hit_left: std_logic;
signal enemy43_hit_top: std_logic;
signal enemy43_hit_right: std_logic;
signal enemy43_hit_bottom: std_logic;
signal enemy43_hit_left: std_logic;

signal enemy50_hit_top: std_logic;
signal enemy50_hit_right: std_logic;
signal enemy50_hit_bottom: std_logic;
signal enemy50_hit_left: std_logic;
signal enemy51_hit_top: std_logic;
signal enemy51_hit_right: std_logic;
signal enemy51_hit_bottom: std_logic;
signal enemy51_hit_left: std_logic;
signal enemy52_hit_top: std_logic;
signal enemy52_hit_right: std_logic;
signal enemy52_hit_bottom: std_logic;
signal enemy52_hit_left: std_logic;
signal enemy53_hit_top: std_logic;
signal enemy53_hit_right: std_logic;
signal enemy53_hit_bottom: std_logic;
signal enemy53_hit_left: std_logic;

signal enemy60_hit_top: std_logic;
signal enemy60_hit_right: std_logic;
signal enemy60_hit_bottom: std_logic;
signal enemy60_hit_left: std_logic;
signal enemy61_hit_top: std_logic;
signal enemy61_hit_right: std_logic;
signal enemy61_hit_bottom: std_logic;
signal enemy61_hit_left: std_logic;
signal enemy62_hit_top: std_logic;
signal enemy62_hit_right: std_logic;
signal enemy62_hit_bottom: std_logic;
signal enemy62_hit_left: std_logic;
signal enemy63_hit_top: std_logic;
signal enemy63_hit_right: std_logic;
signal enemy63_hit_bottom: std_logic;
signal enemy63_hit_left: std_logic;

signal enemy10_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy11_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy12_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy13_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy20_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy21_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy22_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy23_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy30_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy31_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy32_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy33_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy40_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy41_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy42_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy43_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy50_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy51_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy52_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy53_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy60_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy61_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy62_life: std_logic_vector(1 downto 0) := (others => '0');
signal enemy63_life: std_logic_vector(1 downto 0) := (others => '0');

signal enemy10_x_position: natural := ENEMY_X_INIT;
signal enemy10_y_position: natural := ENEMY_Y_INIT;
signal enemy11_x_position: natural := enemy10_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy11_y_position: natural := enemy10_y_position;
signal enemy12_x_position: natural := enemy11_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy12_y_position: natural := enemy11_y_position;
signal enemy13_x_position: natural := enemy12_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy13_y_position: natural := enemy12_y_position;

signal enemy20_x_position: natural := ENEMY_X_INIT + ENEMY_X_PADDING;
signal enemy20_y_position: natural := enemy10_y_position + ENEMY_HEIGHT + ENEMY_Y_PADDING;
signal enemy21_x_position: natural := enemy20_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy21_y_position: natural := enemy20_y_position;
signal enemy22_x_position: natural := enemy21_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy22_y_position: natural := enemy21_y_position;
signal enemy23_x_position: natural := enemy22_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy23_y_position: natural := enemy22_y_position;

signal enemy30_x_position: natural := ENEMY_X_INIT;
signal enemy30_y_position: natural := enemy20_y_position + ENEMY_HEIGHT + ENEMY_Y_PADDING;
signal enemy31_x_position: natural := enemy30_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy31_y_position: natural := enemy30_y_position;
signal enemy32_x_position: natural := enemy31_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy32_y_position: natural := enemy31_y_position;
signal enemy33_x_position: natural := enemy32_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy33_y_position: natural := enemy32_y_position;

signal enemy40_x_position: natural := ENEMY_X_INIT + ENEMY_X_PADDING;
signal enemy40_y_position: natural := enemy30_y_position + ENEMY_HEIGHT + ENEMY_Y_PADDING;
signal enemy41_x_position: natural := enemy40_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy41_y_position: natural := enemy40_y_position;
signal enemy42_x_position: natural := enemy41_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy42_y_position: natural := enemy41_y_position;
signal enemy43_x_position: natural := enemy42_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy43_y_position: natural := enemy42_y_position;

signal enemy50_x_position: natural := ENEMY_X_INIT;
signal enemy50_y_position: natural := enemy40_y_position + ENEMY_HEIGHT + ENEMY_Y_PADDING;
signal enemy51_x_position: natural := enemy50_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy51_y_position: natural := enemy50_y_position;
signal enemy52_x_position: natural := enemy51_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy52_y_position: natural := enemy51_y_position;
signal enemy53_x_position: natural := enemy52_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy53_y_position: natural := enemy52_y_position;

signal enemy60_x_position: natural := ENEMY_X_INIT + ENEMY_X_PADDING;
signal enemy60_y_position: natural := enemy50_y_position + ENEMY_HEIGHT + ENEMY_Y_PADDING;
signal enemy61_x_position: natural := enemy60_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy61_y_position: natural := enemy60_y_position;
signal enemy62_x_position: natural := enemy61_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy62_y_position: natural := enemy61_y_position;
signal enemy63_x_position: natural := enemy62_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
signal enemy63_y_position: natural := enemy62_y_position;


-- Signals VGA controller
signal pxl_clk : std_logic;
signal active : std_logic;
signal hsync, vsync : std_logic;


signal h_cntr_reg : std_logic_vector(11 downto 0) := (others => '0');
signal v_cntr_reg : std_logic_vector(11 downto 0) := (others => '0');


signal h_sync_dly_reg : std_logic;
signal v_sync_dly_reg : std_logic;

signal vga_red_reg : std_logic_vector(4 downto 0) := (others => '0');
signal vga_green_reg : std_logic_vector(5 downto 0) := (others => '0');
signal vga_blue_reg : std_logic_vector(4 downto 0) := (others => '0');

signal vga_red : std_logic_vector(4 downto 0);
signal vga_green : std_logic_vector(5 downto 0);
signal vga_blue : std_logic_vector(4 downto 0);

signal rst_game: std_logic := '0';

signal count_speed: std_logic_vector(31 downto 0) := (others => '0');

signal game_menu: std_logic := '0';

signal btn_rebound_left: std_logic_vector(3 downto 0) := (others => '0');
signal btn_rebound_right: std_logic_vector(3 downto 0) := (others => '0');
signal btn_rebound_speed: std_logic;

begin

  --*******************************--
  --* START/RESET JUEGO           *--
  --*******************************--
  
  
    game_menu <= '1' when (rst_game = '1') or (rst_pin = '1') else '0';
    
    process (game_menu, str_pin)
    begin
        if (game_menu = '1') then
            ball_active <= '0';
        elsif (str_pin = '1') then
            ball_active <= '1';
        end if;
    end process;

  --*******************************--
  --* VELOCIDADES                 *--
  --*******************************--
  
    process (clk_pin, rst_pin)
    begin
        if (rst_pin = '1') then
            count_speed <= (others => '0');
        elsif (rising_edge(clk_pin)) then
            count_speed <= count_speed + 1;
        end if;
    end process;
  
    player_speed <= count_speed(18);
    ball_speed <= count_speed(19); -- 5ms
    enemy_speed <= count_speed(22);
    btn_rebound_speed <= count_speed(19); --125 MHz / 2**19 = 0.00023 MHz => 5 ms
  
  
  --*******************************--
  --* JUGADOR BOTONES             *--
  --*******************************--
    
    process (btn_rebound_speed)
    begin
        if (rising_edge(btn_rebound_speed)) then
            btn_rebound_left <= btn_rebound_left(2 downto 0) & btn_push(0);
            btn_rebound_right <= btn_rebound_right(2 downto 0) & btn_push(1);
        end if;
    end process;
    
    player_to_left <= '1' when (btn_rebound_left = "1111") else
                      '0' when (btn_rebound_left = "0000") else player_to_left; -- '-': Don't care. 
                      
    player_to_right <= '1' when (btn_rebound_right = "1111") else
                       '0' when (btn_rebound_right = "0000") else player_to_right; -- '-': Don't care. 
                       
                       
  --*******************************--
  --* JUGADOR MOVIMIENTOS         *--
  --*******************************--
  
    process (player_speed, game_menu)
    begin
        if (game_menu = '1') then
            player_position <= PLAYER_X_INIT;
        elsif (rising_edge(player_speed)) then
            if ((player_to_left xor player_to_right) = '1') then
                if (player_to_left = '1') and (player_position > GAMEBOX_OFFSET) then
                    player_position <= player_position - 1;
--                    if(ball_active = '0') then
--                        ball_x_dir <= '0';
--                    end if;
                elsif (player_position + PLAYER_WIDTH) < (FRAME_WIDTH - GAMEBOX_OFFSET) then
                    player_position <= player_position + 1;
--                    if(ball_active = '0') then
--                        ball_x_dir <= '1';
--                    end if;                
                end if;
            end if;
        end if;
    end process;
    
    
  --*******************************--
  --* PELOTA MOVIMIENTOS          *--
  --*******************************--
  
    process (ball_speed, game_menu)
    begin
        if (game_menu = '1') then
             ball_x_position <= BALL_X_INIT;
             ball_y_position <= BALL_Y_INIT;
        elsif (rising_edge(ball_speed)) then
            if (ball_active = '0') then
                ball_x_position <= player_position + (PLAYER_WIDTH / 2) - (BALL_WIDTH / 2);
                ball_y_position <= BALL_Y_INIT;
            else
                if (ball_x_dir = '1') then
                    ball_x_position <= ball_x_position + 1;
                else
                    ball_x_position <= ball_x_position - 1;
                end if;
                if (ball_y_dir = '1') then
                    ball_y_position <= ball_y_position + 1;
                else
                    ball_y_position <= ball_y_position - 1;
                end if;
            end if;
        end if;
    end process;
    
  --*******************************--
  --* JUEGO LOGICA                *--
  --*******************************--
  
    player_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => player_position,
        enemy_y_pos => PLAYER_Y_INIT,
        enemy_w => PLAYER_WIDTH,
        enemy_h => PLAYER_HEIGHT,
        hit_top => player_hit_top,
        hit_right => player_hit_right,
        hit_bottom => player_hit_bottom,
        hit_left => player_hit_left
    );
  
    enemy10_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy10_x_position,
        enemy_y_pos => enemy10_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy10_hit_top,
        hit_right => enemy10_hit_right,
        hit_bottom => enemy10_hit_bottom,
        hit_left => enemy10_hit_left
    );
    
    enemy11_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy11_x_position,
        enemy_y_pos => enemy11_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy11_hit_top,
        hit_right => enemy11_hit_right,
        hit_bottom => enemy11_hit_bottom,
        hit_left => enemy11_hit_left
    );
    
    enemy12_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy12_x_position,
        enemy_y_pos => enemy12_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy12_hit_top,
        hit_right => enemy12_hit_right,
        hit_bottom => enemy12_hit_bottom,
        hit_left => enemy12_hit_left
    );
    
    enemy13_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy13_x_position,
        enemy_y_pos => enemy13_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy13_hit_top,
        hit_right => enemy13_hit_right,
        hit_bottom => enemy13_hit_bottom,
        hit_left => enemy13_hit_left
    );
    
    enemy20_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy20_x_position,
        enemy_y_pos => enemy20_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy20_hit_top,
        hit_right => enemy20_hit_right,
        hit_bottom => enemy20_hit_bottom,
        hit_left => enemy20_hit_left
    );
    
    enemy21_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy21_x_position,
        enemy_y_pos => enemy21_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy21_hit_top,
        hit_right => enemy21_hit_right,
        hit_bottom => enemy21_hit_bottom,
        hit_left => enemy21_hit_left
    );
    
    enemy22_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy22_x_position,
        enemy_y_pos => enemy22_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy22_hit_top,
        hit_right => enemy22_hit_right,
        hit_bottom => enemy22_hit_bottom,
        hit_left => enemy22_hit_left
    );
    
    enemy23_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy23_x_position,
        enemy_y_pos => enemy23_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy23_hit_top,
        hit_right => enemy23_hit_right,
        hit_bottom => enemy23_hit_bottom,
        hit_left => enemy23_hit_left
    );
    
    enemy30_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy30_x_position,
        enemy_y_pos => enemy30_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy30_hit_top,
        hit_right => enemy30_hit_right,
        hit_bottom => enemy30_hit_bottom,
        hit_left => enemy30_hit_left
    );
    
    enemy31_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy31_x_position,
        enemy_y_pos => enemy31_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy31_hit_top,
        hit_right => enemy31_hit_right,
        hit_bottom => enemy31_hit_bottom,
        hit_left => enemy31_hit_left
    );
    
    enemy32_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy32_x_position,
        enemy_y_pos => enemy32_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy32_hit_top,
        hit_right => enemy32_hit_right,
        hit_bottom => enemy32_hit_bottom,
        hit_left => enemy32_hit_left
    );
    
    enemy33_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy33_x_position,
        enemy_y_pos => enemy33_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy33_hit_top,
        hit_right => enemy33_hit_right,
        hit_bottom => enemy33_hit_bottom,
        hit_left => enemy33_hit_left
    );
    
    enemy40_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy40_x_position,
        enemy_y_pos => enemy40_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy40_hit_top,
        hit_right => enemy40_hit_right,
        hit_bottom => enemy40_hit_bottom,
        hit_left => enemy40_hit_left
    );
    
    enemy41_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy41_x_position,
        enemy_y_pos => enemy41_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy41_hit_top,
        hit_right => enemy41_hit_right,
        hit_bottom => enemy41_hit_bottom,
        hit_left => enemy41_hit_left
    );
    
    enemy42_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy42_x_position,
        enemy_y_pos => enemy42_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy42_hit_top,
        hit_right => enemy42_hit_right,
        hit_bottom => enemy42_hit_bottom,
        hit_left => enemy42_hit_left
    );
    
    enemy43_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy43_x_position,
        enemy_y_pos => enemy43_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy43_hit_top,
        hit_right => enemy43_hit_right,
        hit_bottom => enemy43_hit_bottom,
        hit_left => enemy43_hit_left
    );
    
    enemy50_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy50_x_position,
        enemy_y_pos => enemy50_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy50_hit_top,
        hit_right => enemy50_hit_right,
        hit_bottom => enemy50_hit_bottom,
        hit_left => enemy50_hit_left
    );
    
    enemy51_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy51_x_position,
        enemy_y_pos => enemy51_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy51_hit_top,
        hit_right => enemy51_hit_right,
        hit_bottom => enemy51_hit_bottom,
        hit_left => enemy51_hit_left
    );
    
    enemy52_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy52_x_position,
        enemy_y_pos => enemy52_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy52_hit_top,
        hit_right => enemy52_hit_right,
        hit_bottom => enemy52_hit_bottom,
        hit_left => enemy52_hit_left
    );
    
    enemy53_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy53_x_position,
        enemy_y_pos => enemy53_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy53_hit_top,
        hit_right => enemy53_hit_right,
        hit_bottom => enemy53_hit_bottom,
        hit_left => enemy53_hit_left
    );
    
    enemy60_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy60_x_position,
        enemy_y_pos => enemy60_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy60_hit_top,
        hit_right => enemy60_hit_right,
        hit_bottom => enemy60_hit_bottom,
        hit_left => enemy60_hit_left
    );
    
    enemy61_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy61_x_position,
        enemy_y_pos => enemy61_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy61_hit_top,
        hit_right => enemy61_hit_right,
        hit_bottom => enemy61_hit_bottom,
        hit_left => enemy61_hit_left
    );
    
    enemy62_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy62_x_position,
        enemy_y_pos => enemy62_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy62_hit_top,
        hit_right => enemy62_hit_right,
        hit_bottom => enemy62_hit_bottom,
        hit_left => enemy62_hit_left
    );
    
    enemy63_hitbox: hit_box
    port map (
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        ball_x_dir => ball_x_dir,
        ball_y_dir => ball_y_dir,
        enemy_x_pos => enemy63_x_position,
        enemy_y_pos => enemy63_y_position,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        hit_top => enemy63_hit_top,
        hit_right => enemy63_hit_right,
        hit_bottom => enemy63_hit_bottom,
        hit_left => enemy63_hit_left
    );
      
    process (ball_speed, game_menu)
    variable hit: boolean := false;
    begin
        hit := false;
        if (game_menu = '1') then
            ball_x_dir <= '1';
            ball_y_dir <= '1';
            enemy10_life <= (others => '0');
            enemy11_life <= (others => '0');
            enemy12_life <= (others => '0');
            enemy13_life <= (others => '0');
            enemy20_life <= (others => '0');
            enemy21_life <= (others => '0');
            enemy22_life <= (others => '0');
            enemy23_life <= (others => '0');
            enemy30_life <= (others => '0');
            enemy31_life <= (others => '0');
            enemy32_life <= (others => '0');
            enemy33_life <= (others => '0');
            enemy40_life <= (others => '0');
            enemy41_life <= (others => '0');
            enemy42_life <= (others => '0');
            enemy43_life <= (others => '0');
            enemy50_life <= (others => '0');
            enemy51_life <= (others => '0');
            enemy52_life <= (others => '0');
            enemy53_life <= (others => '0');
            enemy60_life <= (others => '0');
            enemy61_life <= (others => '0');
            enemy62_life <= (others => '0');
            enemy63_life <= (others => '0');
            
            rst_game <= '0';
        elsif (falling_edge(ball_speed)) then
            if (ball_x_dir = '0') and (ball_x_position <= GAMEBOX_OFFSET) then
                ball_x_dir <= not(ball_x_dir);
            elsif (ball_x_dir = '1') and (ball_x_position + BALL_WIDTH >= GAMEBOX_OFFSET + GAMEBOX_WIDTH) then
                ball_x_dir <= not(ball_x_dir);
            end if;
            if (ball_y_dir = '0') and (ball_y_position <= GAMEBOX_OFFSET) then
                ball_y_dir <= not(ball_y_dir);
            elsif (ball_y_dir = '1') and (ball_y_position + BALL_WIDTH >= FRAME_HEIGHT - 1) then
                ball_x_dir <= not(ball_x_dir);
                rst_game <= '1';
            end if;
        
            if (player_hit_top = '1') then
                ball_y_dir <= not(ball_y_dir);
            elsif (player_hit_bottom = '1') then
                ball_y_dir <= not(ball_y_dir);
            end if;
            if (player_hit_right = '1') then
                ball_x_dir <= not(ball_x_dir);
            elsif (player_hit_left = '1') then
                ball_x_dir <= not(ball_x_dir);
            end if;
        
            if (enemy10_life < ENEMY_DEAD) and (hit = false) then
                if (enemy10_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy10_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy10_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy10_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy10_life <= enemy10_life + 1;
                end if;
            end if;
            
            if (enemy11_life < ENEMY_DEAD) and (hit = false) then
                if (enemy11_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy11_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy11_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy11_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy11_life <= enemy11_life + 1;
                end if;
            end if;
            
            if (enemy12_life < ENEMY_DEAD) and (hit = false) then
                if (enemy12_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy12_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy12_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy12_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy12_life <= enemy12_life + 1;
                end if;
            end if;
            
            if (enemy13_life < ENEMY_DEAD) and (hit = false) then
                if (enemy13_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy13_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy13_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy13_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy13_life <= enemy13_life + 1;
                end if;
            end if;
            
            if (enemy20_life < ENEMY_DEAD) and (hit = false) then
                if (enemy20_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy20_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy20_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy20_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy20_life <= enemy20_life + 1;
                end if;
            end if;
            
            if (enemy21_life < ENEMY_DEAD) and (hit = false) then
                if (enemy21_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy21_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy21_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy21_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy21_life <= enemy21_life + 1;
                end if;
            end if;
            
            if (enemy22_life < ENEMY_DEAD) and (hit = false) then
                if (enemy22_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy22_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy22_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy22_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy22_life <= enemy22_life + 1;
                end if;
            end if;
            
            if (enemy23_life < ENEMY_DEAD) and (hit = false) then
                if (enemy23_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy23_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy23_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy23_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy23_life <= enemy23_life + 1;
                end if;
            end if;
            
            if (enemy30_life < ENEMY_DEAD) and (hit = false) then
                if (enemy30_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy30_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy30_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy30_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy30_life <= enemy30_life + 1;
                end if;
            end if;
            
            if (enemy31_life < ENEMY_DEAD) and (hit = false) then
                if (enemy31_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy31_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy31_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy31_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy31_life <= enemy31_life + 1;
                end if;
            end if;
            
            if (enemy32_life < ENEMY_DEAD) and (hit = false) then
                if (enemy32_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy32_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy32_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy32_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy32_life <= enemy32_life + 1;
                end if;
            end if;
            
            if (enemy33_life < ENEMY_DEAD) and (hit = false) then
                if (enemy33_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy33_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy33_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy33_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy33_life <= enemy33_life + 1;
                end if;
            end if;
            
            if (enemy40_life < ENEMY_DEAD) and (hit = false) then
                if (enemy40_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy40_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy40_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy40_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy40_life <= enemy40_life + 1;
                end if;
            end if;
            
            if (enemy41_life < ENEMY_DEAD) and (hit = false) then
                if (enemy41_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy41_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy41_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy41_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy41_life <= enemy41_life + 1;
                end if;
            end if;
            
            if (enemy42_life < ENEMY_DEAD) and (hit = false) then
                if (enemy42_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy42_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy42_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy42_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy42_life <= enemy42_life + 1;
                end if;
            end if;
            
            if (enemy43_life < ENEMY_DEAD) and (hit = false) then
                if (enemy43_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy43_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy43_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy43_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy43_life <= enemy43_life + 1;
                end if;
            end if;
            
            if (enemy50_life < ENEMY_DEAD) and (hit = false) then
                if (enemy50_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy50_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy50_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy50_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy50_life <= enemy50_life + 1;
                end if;
            end if;
            
            if (enemy51_life < ENEMY_DEAD) and (hit = false) then
                if (enemy51_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy51_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy51_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy51_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy51_life <= enemy51_life + 1;
                end if;
            end if;
            
            if (enemy52_life < ENEMY_DEAD) and (hit = false) then
                if (enemy52_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy52_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy52_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy52_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy52_life <= enemy52_life + 1;
                end if;
            end if;
            
            if (enemy53_life < ENEMY_DEAD) and (hit = false) then
                if (enemy53_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy53_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy53_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy53_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy53_life <= enemy53_life + 1;
                end if;
            end if;
            
            if (enemy60_life < ENEMY_DEAD) and (hit = false) then
                if (enemy60_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy60_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy60_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy60_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy60_life <= enemy60_life + 1;
                end if;
            end if;
            
            if (enemy61_life < ENEMY_DEAD) and (hit = false) then
                if (enemy61_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy61_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy61_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy61_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy61_life <= enemy61_life + 1;
                end if;
            end if;
            
            if (enemy62_life < ENEMY_DEAD) and (hit = false) then
                if (enemy62_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy62_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy62_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy62_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy62_life <= enemy62_life + 1;
                end if;
            end if;
            
            if (enemy63_life < ENEMY_DEAD) and (hit = false) then
                if (enemy63_hit_top = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                elsif (enemy63_hit_bottom = '1') then
                    ball_y_dir <= not(ball_y_dir);
                    hit := true;
                end if;
                if (enemy63_hit_right = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                elsif (enemy63_hit_left = '1') then
                    ball_x_dir <= not(ball_x_dir);
                    hit := true;
                end if;
                if (hit = true) then
                    enemy63_life <= enemy63_life + 1;
                end if;
            end if;
        end if;
    end process;
    
    
  --*******************************--
  --* ENEMIGOS MOVIMIENTOS        *--
  --*******************************--
  
    process (enemy_speed, game_menu)
    begin
        if (game_menu = '1') then
            enemy10_x_position <= ENEMY_X_INIT;
            enemy11_x_position <= enemy10_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            enemy12_x_position <= enemy11_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            enemy13_x_position <= enemy12_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            
            enemy20_x_position <= ENEMY_X_INIT + ENEMY_X_PADDING;
            enemy21_x_position <= enemy20_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            enemy22_x_position <= enemy21_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            enemy23_x_position <= enemy22_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            
            enemy30_x_position <= ENEMY_X_INIT;
            enemy31_x_position <= enemy30_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            enemy32_x_position <= enemy31_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            enemy33_x_position <= enemy32_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            
            enemy40_x_position <= ENEMY_X_INIT + ENEMY_X_PADDING;
            enemy41_x_position <= enemy40_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            enemy42_x_position <= enemy41_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            enemy43_x_position <= enemy42_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            
            enemy50_x_position <= ENEMY_X_INIT;
            enemy51_x_position <= enemy50_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            enemy52_x_position <= enemy51_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            enemy53_x_position <= enemy52_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            
            enemy60_x_position <= ENEMY_X_INIT + ENEMY_X_PADDING;
            enemy61_x_position <= enemy60_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            enemy62_x_position <= enemy61_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
            enemy63_x_position <= enemy62_x_position + ENEMY_WIDTH + ENEMY_MARGIN;
        elsif (rising_edge(enemy_speed)) then
            if (enemy_dir = '1') then
                enemy10_x_position <= enemy10_x_position + 1;
                enemy11_x_position <= enemy11_x_position + 1;
                enemy12_x_position <= enemy12_x_position + 1;
                enemy13_x_position <= enemy13_x_position + 1;
                
                enemy20_x_position <= enemy20_x_position + 1;
                enemy21_x_position <= enemy21_x_position + 1;
                enemy22_x_position <= enemy22_x_position + 1;
                enemy23_x_position <= enemy23_x_position + 1;
                
                enemy30_x_position <= enemy30_x_position + 1;
                enemy31_x_position <= enemy31_x_position + 1;
                enemy32_x_position <= enemy32_x_position + 1;
                enemy33_x_position <= enemy33_x_position + 1;
                
                enemy40_x_position <= enemy40_x_position + 1;
                enemy41_x_position <= enemy41_x_position + 1;
                enemy42_x_position <= enemy42_x_position + 1;
                enemy43_x_position <= enemy43_x_position + 1;
                
                enemy50_x_position <= enemy50_x_position + 1;
                enemy51_x_position <= enemy51_x_position + 1;
                enemy52_x_position <= enemy52_x_position + 1;
                enemy53_x_position <= enemy53_x_position + 1;
                
                enemy60_x_position <= enemy60_x_position + 1;
                enemy61_x_position <= enemy61_x_position + 1;
                enemy62_x_position <= enemy62_x_position + 1;
                enemy63_x_position <= enemy63_x_position + 1;
            else
                enemy10_x_position <= enemy10_x_position - 1;
                enemy11_x_position <= enemy11_x_position - 1;
                enemy12_x_position <= enemy12_x_position - 1;
                enemy13_x_position <= enemy13_x_position - 1;
                
                enemy20_x_position <= enemy20_x_position - 1;
                enemy21_x_position <= enemy21_x_position - 1;
                enemy22_x_position <= enemy22_x_position - 1;
                enemy23_x_position <= enemy23_x_position - 1;
                
                enemy30_x_position <= enemy30_x_position - 1;
                enemy31_x_position <= enemy31_x_position - 1;
                enemy32_x_position <= enemy32_x_position - 1;
                enemy33_x_position <= enemy33_x_position - 1;
                
                enemy40_x_position <= enemy40_x_position - 1;
                enemy41_x_position <= enemy41_x_position - 1;
                enemy42_x_position <= enemy42_x_position - 1;
                enemy43_x_position <= enemy43_x_position - 1;
                
                enemy50_x_position <= enemy50_x_position - 1;
                enemy51_x_position <= enemy51_x_position - 1;
                enemy52_x_position <= enemy52_x_position - 1;
                enemy53_x_position <= enemy53_x_position - 1;
                
                enemy60_x_position <= enemy60_x_position - 1;
                enemy61_x_position <= enemy61_x_position - 1;
                enemy62_x_position <= enemy62_x_position - 1;
                enemy63_x_position <= enemy63_x_position - 1; 
            end if;
        end if;
    end process;
    
  --*******************************--
  --* ENEMIGOS LOGICA             *--
  --*******************************--
  
    process (enemy_speed, game_menu)
    begin
        if (game_menu = '1') then
            enemy_dir <= '1';
        elsif (falling_edge(enemy_speed)) then
            if (enemy_dir = '1') and ((enemy23_x_position + ENEMY_WIDTH) >= (FRAME_WIDTH - GAMEBOX_OFFSET - GAMEBOX_PADDING)) then
                enemy_dir <= not(enemy_dir);
            elsif (enemy_dir = '0') and ((enemy10_x_position) <= (GAMEBOX_OFFSET + GAMEBOX_PADDING)) then
                enemy_dir <= not(enemy_dir);
            end if;         
        end if;
    end process;

  --*******************************--
  --* VGA                         *--
  --*******************************--

    clk_vga_inst: clk_vga
    port map (
        clk_in1 => clk_pin,
        clk_out1 => pxl_clk
    );

    vga_controller: vga_sync 
    port map (
        pxl_clk => pxl_clk, 
        reset => rst_pin,
        hsync => hsync, 
        vsync => vsync, 
        active => active, 
        pixel_x => h_cntr_reg, 
        pixel_y => v_cntr_reg
    );
    
    vga_color: color_pattern
    port map (
        pixel_x => h_cntr_reg,
        pixel_y => v_cntr_reg,
        active => active,
        
        player_x_pos => player_position,
        player_y_pos => PLAYER_Y_INIT,
        player_w => PLAYER_WIDTH,
        player_h => PLAYER_HEIGHT,
        
        ball_x_pos => ball_x_position,
        ball_y_pos => ball_y_position,
        ball_w => BALL_WIDTH,
        ball_h => BALL_HEIGHT,
        
        enemy10_x_pos => enemy10_x_position,
        enemy10_y_pos => enemy10_y_position,
        enemy10_life => enemy10_life,
        enemy11_x_pos => enemy11_x_position,
        enemy11_y_pos => enemy11_y_position,
        enemy11_life => enemy11_life,
        enemy12_x_pos => enemy12_x_position,
        enemy12_y_pos => enemy12_y_position,
        enemy12_life => enemy12_life,
        enemy13_x_pos => enemy13_x_position,
        enemy13_y_pos => enemy13_y_position,
        enemy13_life => enemy13_life,
        enemy20_x_pos => enemy20_x_position,
        enemy20_y_pos => enemy20_y_position,
        enemy20_life => enemy20_life,
        enemy21_x_pos => enemy21_x_position,
        enemy21_y_pos => enemy21_y_position,
        enemy21_life => enemy21_life,
        enemy22_x_pos => enemy22_x_position,
        enemy22_y_pos => enemy22_y_position,
        enemy22_life => enemy22_life,
        enemy23_x_pos => enemy23_x_position,
        enemy23_y_pos => enemy23_y_position,
        enemy23_life => enemy23_life,
        enemy30_x_pos => enemy30_x_position,
        enemy30_y_pos => enemy30_y_position,
        enemy30_life => enemy30_life,
        enemy31_x_pos => enemy31_x_position,
        enemy31_y_pos => enemy31_y_position,
        enemy31_life => enemy31_life,
        enemy32_x_pos => enemy32_x_position,
        enemy32_y_pos => enemy32_y_position,
        enemy32_life => enemy32_life,
        enemy33_x_pos => enemy33_x_position,
        enemy33_y_pos => enemy33_y_position,
        enemy33_life => enemy33_life,
        enemy40_x_pos => enemy40_x_position,
        enemy40_y_pos => enemy40_y_position,
        enemy40_life => enemy40_life,
        enemy41_x_pos => enemy41_x_position,
        enemy41_y_pos => enemy41_y_position,
        enemy41_life => enemy41_life,
        enemy42_x_pos => enemy42_x_position,
        enemy42_y_pos => enemy42_y_position,
        enemy42_life => enemy42_life,
        enemy43_x_pos => enemy43_x_position,
        enemy43_y_pos => enemy43_y_position,
        enemy43_life => enemy43_life,
        enemy50_x_pos => enemy50_x_position,
        enemy50_y_pos => enemy50_y_position,
        enemy50_life => enemy50_life,
        enemy51_x_pos => enemy51_x_position,
        enemy51_y_pos => enemy51_y_position,
        enemy51_life => enemy51_life,
        enemy52_x_pos => enemy52_x_position,
        enemy52_y_pos => enemy52_y_position,
        enemy52_life => enemy52_life,
        enemy53_x_pos => enemy53_x_position,
        enemy53_y_pos => enemy53_y_position,
        enemy53_life => enemy53_life,
        enemy60_x_pos => enemy60_x_position,
        enemy60_y_pos => enemy60_y_position,
        enemy60_life => enemy60_life,
        enemy61_x_pos => enemy61_x_position,
        enemy61_y_pos => enemy61_y_position,
        enemy61_life => enemy61_life,
        enemy62_x_pos => enemy62_x_position,
        enemy62_y_pos => enemy62_y_position,
        enemy62_life => enemy62_life,
        enemy63_x_pos => enemy63_x_position,
        enemy63_y_pos => enemy63_y_position,
        enemy63_life => enemy63_life,
        enemy_w => ENEMY_WIDTH,
        enemy_h => ENEMY_HEIGHT,
        
        gamebox_x_pos => GAMEBOX_OFFSET,
        gamebox_y_pos => GAMEBOX_OFFSET,
        gamebox_w => GAMEBOX_WIDTH,
        gamebox_h => GAMEBOX_HEIGHT,
        
        vga_red_out => vga_red,
        vga_green_out => vga_green,
        vga_blue_out => vga_blue
    );
    
    process (pxl_clk)
    begin
        if (rising_edge(pxl_clk)) then
            v_sync_dly_reg <= vsync;
            h_sync_dly_reg <= hsync;
            vga_red_reg <= vga_red;
            vga_green_reg <= vga_green;
            vga_blue_reg <= vga_blue;
        end if;
    end process;
    
    vga_hs <= h_sync_dly_reg;
    vga_vs <= v_sync_dly_reg;
    vga_r <= vga_red_reg;
    vga_g <= vga_green_reg;
    vga_b <= vga_blue_reg;


end Behavioral;
