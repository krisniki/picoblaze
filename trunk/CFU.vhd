----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:33:33 03/19/2010 
-- Design Name: 
-- Module Name:    CFU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CFU is

	port(
		--***********
		-- INPUT
		--***********
		-- value for the Program Counter
		address		: in std_logic_vector(7 downto 0);
		-- code of the operation (JUMP, CALL, INTERRUPT, RETURNI, ...)
		operation	: in std_logic_vector(4 downto 0);
		-- interrupt enable. Whether or not the interruptions are enable
		interrupt_e	: in std_logic;
		-- FLAGS
		zero_flag	: in std_logic;
		carry_flag	: in std_logic;
		
		--***********
		-- CONTROL
		--***********
		clock			: in std_logic;
		reset			: in std_logic;
		
		--***********
		-- OUTPUT
		--***********
		flag_source	: out std_logic;
		int_wenable	: out std_logic;
		PC_out		: out std_logic_vector(7 downto 0);
		PC_source	: out std_logic;
		PC_we			: out std_logic;
		
	);

end CFU;

architecture Behavioral of CFU is

begin


end Behavioral;

