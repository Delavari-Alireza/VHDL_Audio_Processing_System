--------------------------------------------------------------------------------

-- 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY PROZHE_test IS
END PROZHE_test;
 
ARCHITECTURE behavior OF PROZHE_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PROZHE
    PORT(
         BCLK : IN  std_logic;
         Reset : IN  std_logic;
         DR : IN  std_logic;
         InST1 : IN  std_logic_vector(4 downto 0);
         InST2 : IN  std_logic_vector(4 downto 0);
         OutST : IN  std_logic_vector(4 downto 0);
         DX : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal BCLK : std_logic := '0';
   signal Reset : std_logic := '0';
   signal DR : std_logic := '0';
   signal InST1 : std_logic_vector(4 downto 0) := (others => '0');
   signal InST2 : std_logic_vector(4 downto 0) := (others => '0');
   signal OutST : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal DX : std_logic;

   -- Clock period definitions
   --constant BCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PROZHE PORT MAP (
          BCLK => BCLK,
          Reset => Reset,
          DR => DR,
          InST1 => InST1,
          InST2 => InST2,
          OutST => OutST,
          DX => DX
        );

   -- Clock process definitions
   BCLK <= NOT BCLK AFTER 5 NS;
	Reset <= '1' AFTER 800 NS, '0' AFTER 810 NS;
	DR <= NOT DR AFTER 3 NS;
	InST1 <= "01111";
   InST2 <= "00111";
	OutST <= "00011";

END;
