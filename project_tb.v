
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:08:33 04/21/2023
// Design Name:   music_notes
// Module Name:   /home/ise/fpga/latikaproject/project_tb.v
// Project Name:  latikaproject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: music_notes
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module project_tb;

	// Inputs
	reg [7:0] dip_switches;
	reg clk;

	// Outputs
	wire speaker;

	// Instantiate the Unit Under Test (UUT)
	music_notes uut (
		.dip_switches(dip_switches), 
		.clk(clk), 
		.speaker(speaker)
	);

	initial begin
		// Initialize Inputs
		dip_switches = 0;
		clk = 1;
		
		#100;
      dip_switches =  8'b00000001;
		#100;
      dip_switches = 8'b00000010;
		#100;
        dip_switches =8'b00000100;
		  #100;
        dip_switches =8'b00001000;
		  #100;
        dip_switches =8'b00010000;
		  #100;
        dip_switches =8'b00100000;
		  #100;
        dip_switches =8'b01000000;
		  #100;
        dip_switches =8'b10000000;
			#100;

	end

always #5 clk = ~clk;
endmodule

