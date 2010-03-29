----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:31:50 03/19/2010 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is

	generic(
		 input_length			: positive := 8
	);

	port(
		in_1			: in std_logic_vector(input_length -1 downto 0);
		in_2			: in std_logic_vector(input_length -1 downto 0);
		operation	: in std_logic_vector(4 downto 0);
		carry_in		: in std_logic;
		
		result		: out std_logic_vector(input_length downto 0);
		carry_out	: out std_logic;
		zero_out		: out std_logic
	);
end ALU;

architecture Behavioral of ALU is

	--****************************************************************
	-- OPERATION CODE CONSTANTS
	--****************************************************************
	constant op_add		 	: std_logic_vector(4 downto 0) := "00000";
	constant op_addCarry		: std_logic_vector(4 downto 0) := "00001";
	
	--****************************************************************
	-- SIGNALS
	--****************************************************************
	signal zero_value : std_logic;
	
	--****************************************************************
	-- PROCEDURES
	--****************************************************************
	procedure addition(
		signal in_1			: in std_logic_vector(input_length -1 downto 0);
		signal in_2			: in std_logic_vector(input_length -1 downto 0);
		signal carry_in	: in std_logic;
		signal result		: out std_logic_vector(input_length -1 downto 0);
		signal carry_out	: out std_logic) is
		
		-- stores the result of the addition + the carry of it, that's why
		-- it has a bit more than the inputs.
		variable par_result	: std_logic_vector(input_length downto 0) := (others => '0');
		variable carry_ext	: std_logic_vector(input_length -1 downto 0);
	begin
		-- extends the carry value
		carry_ext(0) := carry_in;
		
		-- computes the addition
		par_result := in_1 + in_2 + carry_in;

		-- the carry is the MSB in part_result
		carry_out <= par_result(input_length);
		-- the result are the other bits
		result <= par_result(input_length -1 downto 0);
	end procedure addition;
	
	
begin

	zero_value <= '0';
	
	execution : process(in_1, in_2, operation, carry_in)
	begin
		case operation is
			--****************************
			-- addition without carry_in
			--****************************
			when op_add =>
				-- a zero is sent as carry
				addition(in_1, in_2, zero_value, result, carry_out);
			
			--****************************
			-- addition with carry_in
			--****************************
			when op_addCarry =>
				addition(in_1, in_2, carry_in, result, carry_out);
				
			-- TODO
			-- add a constant declaration in the architecture declaration
			-- create a procedure to implement the given operation
				
			when others =>
		end case;		
	end process;
	
	-- zero flag
	--zero_out <= '1' when result = (others => '0') else
	--				'0';
	
	

	
end Behavioral;


