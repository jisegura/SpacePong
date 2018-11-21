----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2018 07:31:39 PM
-- Design Name: 
-- Module Name: color_pattern - Behavioral
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


library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity color_pattern is
    Port (
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
end color_pattern;

architecture Behavioral of color_pattern is

constant BALL_COLOR_RED: std_logic_vector(4 downto 0) := "11111";
constant PLAYER_COLOR_RED: std_logic_vector(4 downto 0) := "00000";
constant ENEMY_LIFE_00_COLOR_RED: std_logic_vector(4 downto 0) := "11111";
constant ENEMY_LIFE_01_COLOR_RED: std_logic_vector(4 downto 0) := "11111";
constant ENEMY_LIFE_10_COLOR_RED: std_logic_vector(4 downto 0) := "11111";
constant GAMEBOX_COLOR_RED: std_logic_vector(4 downto 0) := "00000";
constant BACKGROUND_COLOR_RED: std_logic_vector(4 downto 0) := "00111";

constant BALL_COLOR_GREEN: std_logic_vector(5 downto 0) := "111111";
constant PLAYER_COLOR_GREEN: std_logic_vector(5 downto 0) := "000000";
constant ENEMY_LIFE_00_COLOR_GREEN: std_logic_vector(5 downto 0) := "111011";
constant ENEMY_LIFE_01_COLOR_GREEN: std_logic_vector(5 downto 0) := "010111";
constant ENEMY_LIFE_10_COLOR_GREEN: std_logic_vector(5 downto 0) := "000100";
constant GAMEBOX_COLOR_GREEN: std_logic_vector(5 downto 0) := "000000";
constant BACKGROUND_COLOR_GREEN: std_logic_vector(5 downto 0) := "001111";

constant BALL_COLOR_BLUE: std_logic_vector(4 downto 0) := "11111";
constant PLAYER_COLOR_BLUE: std_logic_vector(4 downto 0) := "11111";
constant ENEMY_LIFE_00_COLOR_BLUE: std_logic_vector(4 downto 0) := "11011";
constant ENEMY_LIFE_01_COLOR_BLUE: std_logic_vector(4 downto 0) := "00100";
constant ENEMY_LIFE_10_COLOR_BLUE: std_logic_vector(4 downto 0) := "00001";
constant GAMEBOX_COLOR_BLUE: std_logic_vector(4 downto 0) := "00000";
constant BACKGROUND_COLOR_BLUE: std_logic_vector(4 downto 0) := "00001";

signal vga_red: std_logic_vector(4 downto 0);
signal vga_green: std_logic_vector(5 downto 0);
signal vga_blue: std_logic_vector(4 downto 0);

signal in_player: std_logic := '0';
signal in_ball: std_logic := '0';
signal in_enemy10: std_logic := '0';
signal in_enemy11: std_logic := '0';
signal in_enemy12: std_logic := '0';
signal in_enemy13: std_logic := '0';
signal in_enemy20: std_logic := '0';
signal in_enemy21: std_logic := '0';
signal in_enemy22: std_logic := '0';
signal in_enemy23: std_logic := '0';
signal in_enemy30: std_logic := '0';
signal in_enemy31: std_logic := '0';
signal in_enemy32: std_logic := '0';
signal in_enemy33: std_logic := '0';
signal in_enemy40: std_logic := '0';
signal in_enemy41: std_logic := '0';
signal in_enemy42: std_logic := '0';
signal in_enemy43: std_logic := '0';
signal in_enemy50: std_logic := '0';
signal in_enemy51: std_logic := '0';
signal in_enemy52: std_logic := '0';
signal in_enemy53: std_logic := '0';
signal in_enemy60: std_logic := '0';
signal in_enemy61: std_logic := '0';
signal in_enemy62: std_logic := '0';
signal in_enemy63: std_logic := '0';
signal in_gamebox: std_logic := '0';

begin

    in_player <= '1' when (player_x_pos <= pixel_x) and
                          (pixel_x <= player_x_pos + player_w) and
                          (player_y_pos <= pixel_y) and
                          (pixel_y <= player_y_pos + player_h) else '0';

    in_ball <= '1' when (ball_x_pos <= pixel_x) and
                        (pixel_x <= ball_x_pos + ball_w) and
                        (ball_y_pos <= pixel_y) and
                        (pixel_y <= ball_y_pos + ball_h) else '0';
                        
    in_enemy10 <= '1' when (enemy10_x_pos <= pixel_x) and
                           (pixel_x <= enemy10_x_pos + enemy_w) and
                           (enemy10_y_pos <= pixel_y) and
                           (pixel_y <= enemy10_y_pos + enemy_h) else '0';
                           
    in_enemy11 <= '1' when (enemy11_x_pos <= pixel_x) and
                           (pixel_x <= enemy11_x_pos + enemy_w) and
                           (enemy11_y_pos <= pixel_y) and
                           (pixel_y <= enemy11_y_pos + enemy_h) else '0';
                           
    in_enemy12 <= '1' when (enemy12_x_pos <= pixel_x) and
                           (pixel_x <= enemy12_x_pos + enemy_w) and
                           (enemy12_y_pos <= pixel_y) and
                           (pixel_y <= enemy12_y_pos + enemy_h) else '0';
                           
    in_enemy13 <= '1' when (enemy13_x_pos <= pixel_x) and
                           (pixel_x <= enemy13_x_pos + enemy_w) and
                           (enemy13_y_pos <= pixel_y) and
                           (pixel_y <= enemy13_y_pos + enemy_h) else '0';
                           
    in_enemy20 <= '1' when (enemy20_x_pos <= pixel_x) and
                           (pixel_x <= enemy20_x_pos + enemy_w) and
                           (enemy20_y_pos <= pixel_y) and
                           (pixel_y <= enemy20_y_pos + enemy_h) else '0';
                           
    in_enemy21 <= '1' when (enemy21_x_pos <= pixel_x) and
                           (pixel_x <= enemy21_x_pos + enemy_w) and
                           (enemy21_y_pos <= pixel_y) and
                           (pixel_y <= enemy21_y_pos + enemy_h) else '0';
                           
    in_enemy22 <= '1' when (enemy22_x_pos <= pixel_x) and
                           (pixel_x <= enemy22_x_pos + enemy_w) and
                           (enemy22_y_pos <= pixel_y) and
                           (pixel_y <= enemy22_y_pos + enemy_h) else '0';
                           
    in_enemy23 <= '1' when (enemy23_x_pos <= pixel_x) and
                           (pixel_x <= enemy23_x_pos + enemy_w) and
                           (enemy23_y_pos <= pixel_y) and
                           (pixel_y <= enemy23_y_pos + enemy_h) else '0';
   
    in_enemy30 <= '1' when (enemy30_x_pos <= pixel_x) and
                           (pixel_x <= enemy30_x_pos + enemy_w) and
                           (enemy30_y_pos <= pixel_y) and
                           (pixel_y <= enemy30_y_pos + enemy_h) else '0';
   
    in_enemy31 <= '1' when (enemy31_x_pos <= pixel_x) and
                           (pixel_x <= enemy31_x_pos + enemy_w) and
                           (enemy31_y_pos <= pixel_y) and
                           (pixel_y <= enemy31_y_pos + enemy_h) else '0';
   
    in_enemy32 <= '1' when (enemy32_x_pos <= pixel_x) and
                           (pixel_x <= enemy32_x_pos + enemy_w) and
                           (enemy32_y_pos <= pixel_y) and
                           (pixel_y <= enemy32_y_pos + enemy_h) else '0';
   
    in_enemy33 <= '1' when (enemy33_x_pos <= pixel_x) and
                           (pixel_x <= enemy33_x_pos + enemy_w) and
                           (enemy33_y_pos <= pixel_y) and
                           (pixel_y <= enemy33_y_pos + enemy_h) else '0';
   
    in_enemy40 <= '1' when (enemy40_x_pos <= pixel_x) and
                           (pixel_x <= enemy40_x_pos + enemy_w) and
                           (enemy40_y_pos <= pixel_y) and
                           (pixel_y <= enemy40_y_pos + enemy_h) else '0';
   
    in_enemy41 <= '1' when (enemy41_x_pos <= pixel_x) and
                           (pixel_x <= enemy41_x_pos + enemy_w) and
                           (enemy41_y_pos <= pixel_y) and
                           (pixel_y <= enemy41_y_pos + enemy_h) else '0';
   
    in_enemy42 <= '1' when (enemy42_x_pos <= pixel_x) and
                           (pixel_x <= enemy42_x_pos + enemy_w) and
                           (enemy42_y_pos <= pixel_y) and
                           (pixel_y <= enemy42_y_pos + enemy_h) else '0';
   
    in_enemy43 <= '1' when (enemy43_x_pos <= pixel_x) and
                           (pixel_x <= enemy43_x_pos + enemy_w) and
                           (enemy43_y_pos <= pixel_y) and
                           (pixel_y <= enemy43_y_pos + enemy_h) else '0';
   
    in_enemy50 <= '1' when (enemy50_x_pos <= pixel_x) and
                           (pixel_x <= enemy50_x_pos + enemy_w) and
                           (enemy50_y_pos <= pixel_y) and
                           (pixel_y <= enemy50_y_pos + enemy_h) else '0';
   
    in_enemy51 <= '1' when (enemy51_x_pos <= pixel_x) and
                           (pixel_x <= enemy51_x_pos + enemy_w) and
                           (enemy51_y_pos <= pixel_y) and
                           (pixel_y <= enemy51_y_pos + enemy_h) else '0';
   
    in_enemy52 <= '1' when (enemy52_x_pos <= pixel_x) and
                           (pixel_x <= enemy52_x_pos + enemy_w) and
                           (enemy52_y_pos <= pixel_y) and
                           (pixel_y <= enemy52_y_pos + enemy_h) else '0';
   
    in_enemy53 <= '1' when (enemy53_x_pos <= pixel_x) and
                           (pixel_x <= enemy53_x_pos + enemy_w) and
                           (enemy53_y_pos <= pixel_y) and
                           (pixel_y <= enemy53_y_pos + enemy_h) else '0';
   
    in_enemy60 <= '1' when (enemy60_x_pos <= pixel_x) and
                           (pixel_x <= enemy60_x_pos + enemy_w) and
                           (enemy60_y_pos <= pixel_y) and
                           (pixel_y <= enemy60_y_pos + enemy_h) else '0';
   
    in_enemy61 <= '1' when (enemy61_x_pos <= pixel_x) and
                           (pixel_x <= enemy61_x_pos + enemy_w) and
                           (enemy61_y_pos <= pixel_y) and
                           (pixel_y <= enemy61_y_pos + enemy_h) else '0';
   
    in_enemy62 <= '1' when (enemy62_x_pos <= pixel_x) and
                           (pixel_x <= enemy62_x_pos + enemy_w) and
                           (enemy62_y_pos <= pixel_y) and
                           (pixel_y <= enemy62_y_pos + enemy_h) else '0';
   
    in_enemy63 <= '1' when (enemy63_x_pos <= pixel_x) and
                           (pixel_x <= enemy63_x_pos + enemy_w) and
                           (enemy63_y_pos <= pixel_y) and
                           (pixel_y <= enemy63_y_pos + enemy_h) else '0';
                           
    in_gamebox <= '1' when (gamebox_x_pos <= pixel_x) and
                           (pixel_x <= gamebox_x_pos + gamebox_w) and
                           (gamebox_y_pos <= pixel_y) and
                           (pixel_y <= gamebox_y_pos + gamebox_h) else '0';
                           
    vga_red <= BALL_COLOR_RED when (in_ball = '1') else
               PLAYER_COLOR_RED when (in_player = '1') else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy10 = '1') and (enemy10_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy10 = '1') and (enemy10_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy10 = '1') and (enemy10_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy11 = '1') and (enemy11_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy11 = '1') and (enemy11_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy11 = '1') and (enemy11_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy12 = '1') and (enemy12_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy12 = '1') and (enemy12_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy12 = '1') and (enemy12_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy13 = '1') and (enemy13_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy13 = '1') and (enemy13_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy13 = '1') and (enemy13_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy20 = '1') and (enemy20_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy20 = '1') and (enemy20_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy20 = '1') and (enemy20_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy21 = '1') and (enemy21_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy21 = '1') and (enemy21_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy21 = '1') and (enemy21_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy22 = '1') and (enemy22_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy22 = '1') and (enemy22_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy22 = '1') and (enemy22_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy23 = '1') and (enemy23_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy23 = '1') and (enemy23_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy23 = '1') and (enemy23_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy30 = '1') and (enemy30_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy30 = '1') and (enemy30_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy30 = '1') and (enemy30_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy31 = '1') and (enemy31_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy31 = '1') and (enemy31_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy31 = '1') and (enemy31_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy32 = '1') and (enemy32_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy32 = '1') and (enemy32_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy32 = '1') and (enemy32_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy33 = '1') and (enemy33_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy33 = '1') and (enemy33_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy33 = '1') and (enemy33_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy40 = '1') and (enemy40_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy40 = '1') and (enemy40_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy40 = '1') and (enemy40_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy41 = '1') and (enemy41_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy41 = '1') and (enemy41_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy41 = '1') and (enemy41_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy42 = '1') and (enemy42_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy42 = '1') and (enemy42_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy42 = '1') and (enemy42_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy43 = '1') and (enemy43_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy43 = '1') and (enemy43_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy43 = '1') and (enemy43_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy50 = '1') and (enemy50_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy50 = '1') and (enemy50_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy50 = '1') and (enemy50_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy51 = '1') and (enemy51_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy51 = '1') and (enemy51_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy51 = '1') and (enemy51_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy52 = '1') and (enemy52_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy52 = '1') and (enemy52_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy52 = '1') and (enemy52_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy53 = '1') and (enemy53_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy53 = '1') and (enemy53_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy53 = '1') and (enemy53_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy60 = '1') and (enemy60_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy60 = '1') and (enemy60_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy60 = '1') and (enemy60_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy61 = '1') and (enemy61_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy61 = '1') and (enemy61_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy61 = '1') and (enemy61_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy62 = '1') and (enemy62_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy62 = '1') and (enemy62_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy62 = '1') and (enemy62_life = "10") else
               ENEMY_LIFE_00_COLOR_RED when (in_enemy63 = '1') and (enemy63_life = "00") else
               ENEMY_LIFE_01_COLOR_RED when (in_enemy63 = '1') and (enemy63_life = "01") else
               ENEMY_LIFE_10_COLOR_RED when (in_enemy63 = '1') and (enemy63_life = "10") else
               GAMEBOX_COLOR_RED when (in_gamebox = '1') else BACKGROUND_COLOR_RED;
               
    vga_green <= BALL_COLOR_GREEN when (in_ball = '1') else
                 PLAYER_COLOR_GREEN when (in_player = '1') else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy10 = '1') and (enemy10_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy10 = '1') and (enemy10_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy10 = '1') and (enemy10_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy11 = '1') and (enemy11_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy11 = '1') and (enemy11_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy11 = '1') and (enemy11_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy12 = '1') and (enemy12_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy12 = '1') and (enemy12_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy12 = '1') and (enemy12_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy13 = '1') and (enemy13_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy13 = '1') and (enemy13_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy13 = '1') and (enemy13_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy20 = '1') and (enemy20_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy20 = '1') and (enemy20_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy20 = '1') and (enemy20_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy21 = '1') and (enemy21_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy21 = '1') and (enemy21_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy21 = '1') and (enemy21_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy22 = '1') and (enemy22_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy22 = '1') and (enemy22_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy22 = '1') and (enemy22_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy23 = '1') and (enemy23_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy23 = '1') and (enemy23_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy23 = '1') and (enemy23_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy30 = '1') and (enemy30_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy30 = '1') and (enemy30_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy30 = '1') and (enemy30_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy31 = '1') and (enemy31_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy31 = '1') and (enemy31_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy31 = '1') and (enemy31_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy32 = '1') and (enemy32_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy32 = '1') and (enemy32_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy32 = '1') and (enemy32_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy33 = '1') and (enemy33_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy33 = '1') and (enemy33_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy33 = '1') and (enemy33_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy40 = '1') and (enemy40_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy40 = '1') and (enemy40_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy40 = '1') and (enemy40_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy41 = '1') and (enemy41_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy41 = '1') and (enemy41_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy41 = '1') and (enemy41_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy42 = '1') and (enemy42_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy42 = '1') and (enemy42_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy42 = '1') and (enemy42_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy43 = '1') and (enemy43_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy43 = '1') and (enemy43_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy43 = '1') and (enemy43_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy50 = '1') and (enemy50_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy50 = '1') and (enemy50_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy50 = '1') and (enemy50_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy51 = '1') and (enemy51_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy51 = '1') and (enemy51_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy51 = '1') and (enemy51_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy52 = '1') and (enemy52_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy52 = '1') and (enemy52_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy52 = '1') and (enemy52_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy53 = '1') and (enemy53_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy53 = '1') and (enemy53_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy53 = '1') and (enemy53_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy60 = '1') and (enemy60_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy60 = '1') and (enemy60_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy60 = '1') and (enemy60_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy61 = '1') and (enemy61_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy61 = '1') and (enemy61_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy61 = '1') and (enemy61_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy62 = '1') and (enemy62_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy62 = '1') and (enemy62_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy62 = '1') and (enemy62_life = "10") else
                 ENEMY_LIFE_00_COLOR_GREEN when (in_enemy63 = '1') and (enemy63_life = "00") else
                 ENEMY_LIFE_01_COLOR_GREEN when (in_enemy63 = '1') and (enemy63_life = "01") else
                 ENEMY_LIFE_10_COLOR_GREEN when (in_enemy63 = '1') and (enemy63_life = "10") else
                 GAMEBOX_COLOR_GREEN when (in_gamebox = '1') else BACKGROUND_COLOR_GREEN;
                 
    vga_blue <= BALL_COLOR_BLUE when (in_ball = '1') else
                PLAYER_COLOR_BLUE when (in_player = '1') else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy10 = '1') and (enemy10_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy10 = '1') and (enemy10_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy10 = '1') and (enemy10_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy11 = '1') and (enemy11_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy11 = '1') and (enemy11_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy11 = '1') and (enemy11_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy12 = '1') and (enemy12_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy12 = '1') and (enemy12_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy12 = '1') and (enemy12_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy13 = '1') and (enemy13_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy13 = '1') and (enemy13_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy13 = '1') and (enemy13_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy20 = '1') and (enemy20_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy20 = '1') and (enemy20_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy20 = '1') and (enemy20_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy21 = '1') and (enemy21_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy21 = '1') and (enemy21_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy21 = '1') and (enemy21_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy22 = '1') and (enemy22_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy22 = '1') and (enemy22_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy22 = '1') and (enemy22_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy23 = '1') and (enemy23_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy23 = '1') and (enemy23_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy23 = '1') and (enemy23_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy30 = '1') and (enemy30_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy30 = '1') and (enemy30_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy30 = '1') and (enemy30_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy31 = '1') and (enemy31_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy31 = '1') and (enemy31_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy31 = '1') and (enemy31_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy32 = '1') and (enemy32_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy32 = '1') and (enemy32_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy32 = '1') and (enemy32_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy33 = '1') and (enemy33_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy33 = '1') and (enemy33_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy33 = '1') and (enemy33_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy40 = '1') and (enemy40_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy40 = '1') and (enemy40_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy40 = '1') and (enemy40_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy41 = '1') and (enemy41_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy41 = '1') and (enemy41_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy41 = '1') and (enemy41_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy42 = '1') and (enemy42_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy42 = '1') and (enemy42_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy42 = '1') and (enemy42_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy43 = '1') and (enemy43_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy43 = '1') and (enemy43_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy43 = '1') and (enemy43_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy50 = '1') and (enemy50_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy50 = '1') and (enemy50_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy50 = '1') and (enemy50_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy51 = '1') and (enemy51_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy51 = '1') and (enemy51_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy51 = '1') and (enemy51_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy52 = '1') and (enemy52_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy52 = '1') and (enemy52_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy52 = '1') and (enemy52_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy53 = '1') and (enemy53_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy53 = '1') and (enemy53_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy53 = '1') and (enemy53_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy60 = '1') and (enemy60_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy60 = '1') and (enemy60_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy60 = '1') and (enemy60_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy61 = '1') and (enemy61_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy61 = '1') and (enemy61_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy61 = '1') and (enemy61_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy62 = '1') and (enemy62_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy62 = '1') and (enemy62_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy62 = '1') and (enemy62_life = "10") else
                ENEMY_LIFE_00_COLOR_BLUE when (in_enemy63 = '1') and (enemy63_life = "00") else
                ENEMY_LIFE_01_COLOR_BLUE when (in_enemy63 = '1') and (enemy63_life = "01") else
                ENEMY_LIFE_10_COLOR_BLUE when (in_enemy63 = '1') and (enemy63_life = "10") else
                GAMEBOX_COLOR_BLUE when (in_gamebox = '1') else BACKGROUND_COLOR_BLUE;
                
    vga_red_out <= vga_red when (active = '1') else (others => '0');
    vga_green_out <= vga_green when (active = '1') else (others => '0');
    vga_blue_out <= vga_blue when (active = '1') else (others => '0');


end Behavioral;
