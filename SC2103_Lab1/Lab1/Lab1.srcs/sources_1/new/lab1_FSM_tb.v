`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2023 14:42:46
// Design Name: 
// Module Name: lab1_FSM_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab1_FSM_tb();
    reg fifty, dollar, cancel, rst, clk;
	wire [1:0] st;
	
	// Instantiate the Unit Under Test (UUT)
	lab1_FSM DUT (.fifty(fifty),.dollar(dollar),.cancel(cancel),
				.rst(rst), .clk(clk), .st(st));

	initial begin
		// Add stimulus here
        clk = 0; rst = 1; fifty = 0; dollar = 0; cancel = 0;
        #10 rst = 0;    // to INIT (0) state
        #10 fifty = 1;    // to S50c (1) state
        #10 fifty = 0;
        #10 fifty = 1;    // to VEND (2) state
        #10 fifty = 0;
        #20 rst = 1;    // RESET, to INIT (0) state
        #10 rst = 0;
        #10 dollar = 1;    // to  VEND (2) state
        #10 dollar = 0;
        #20 rst = 1;    // RESET, to INIT (0) state
        #10 rst = 0;
        #10 fifty = 1;    // to S50c (1) state
        #10 fifty = 0;
        #10 dollar = 1;    // to RETURN (3) state
        #10 dollar = 0;    // to INIT (0) state
        #20 fifty = 1;    // to S50c (1) state
        #10 fifty = 0;
        #10 cancel = 1;    // to RETURN (3) state
        #10 cancel = 0;    // to INIT (0) state
		#20
		$finish();

	end
	
	always #5 clk = ~clk;
endmodule
