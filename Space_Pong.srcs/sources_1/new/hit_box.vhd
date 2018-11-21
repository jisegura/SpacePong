----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2018 01:56:18 PM
-- Design Name: 
-- Module Name: hit_box - Behavioral
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

entity hit_box is
    Port (
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
end hit_box;

architecture Behavioral of hit_box is

signal ball_w_total: natural;
signal ball_h_total: natural;
signal enemy_w_total: natural;
signal enemy_h_total: natural;

begin

    ball_w_total <= ball_x_pos + ball_w;
    ball_h_total <= ball_y_pos + ball_h;
    enemy_w_total <= enemy_x_pos + enemy_w;
    enemy_h_total <= enemy_y_pos + enemy_h;

    hit_top <= '1' when (ball_w_total >= enemy_x_pos) and
                        (ball_x_pos <= enemy_w_total) and
                        (ball_y_dir = '1') and
                        (ball_h_total <= enemy_y_pos) and (ball_h_total >= enemy_y_pos - 2) else '0';
                        
    hit_right <= '1' when (ball_h_total >= enemy_y_pos) and
                          (ball_y_pos <= enemy_h_total) and
                          (ball_x_dir = '0') and
                          (ball_x_pos >= enemy_w_total) and (ball_x_pos <= enemy_w_total + 2) else '0';
                          
    hit_bottom <= '1' when (ball_w_total >= enemy_x_pos) and
                           (ball_x_pos <= enemy_w_total) and
                           (ball_y_dir = '0') and
                           (ball_y_pos >= enemy_h_total) and (ball_y_pos <= enemy_h_total + 2) else '0';
                                                  
    hit_left <= '1' when (ball_h_total >= enemy_y_pos) and
                         (ball_y_pos <= enemy_h_total) and
                         (ball_x_dir = '1') and
                         (ball_w_total <= enemy_x_pos) and (ball_w_total >= enemy_x_pos - 2) else '0';

end Behavioral;
