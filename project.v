module music_notes(
    input [7:0] dip_switches, // 8-bit input for dip switches
	 input clk,
    output reg speaker        // output for speaker
);

reg clk_50 = 0;
integer count  = 0; 

initial begin
speaker <= 0;
duration <= 0;
end
 
parameter sys_clk = 100000000;
parameter clk_out = 50000000;

parameter max = sys_clk/(2*clk_out);

always @(posedge clk) begin

	 if(count == max-1)begin
	 count = 0;
	 clk_50 = ~clk_50;
	 end else begin
	 count = count + 1;
	 end
	 
end
  
  
// Define musical notes in Hz
parameter C4 = 261;
parameter D4 = 293;
parameter E4 = 329;
parameter F4 = 349;
parameter G4 = 392;
parameter A4 = 440;
parameter B4 = 493;
parameter C5 = 523;

// Define note durations in seconds
parameter quarter = 25;
parameter half = 50;
parameter whole = 100;

// Define frequency and duration variables
reg [15:0] frequency;
reg [15:0] duration;

// Assign frequency based on dip switch input
always @(*) begin
    case (dip_switches)
        8'b00000001: frequency = C4;
        8'b00000010: frequency = D4;
        8'b00000100: frequency = E4;
        8'b00001000: frequency = F4;
        8'b00010000: frequency = G4;
        8'b00100000: frequency = A4;
        8'b01000000: frequency = B4;
        8'b10000000: frequency = C5;
        default: frequency = 0;
    endcase

end

// Assign duration based on dip switch input
always @(posedge clk_50) begin
    case (dip_switches)
        8'b00000001: duration <= quarter;
        8'b00000010: duration <= quarter;
        8'b00000100: duration <= quarter;
        8'b00001000: duration <= quarter;
        8'b00010000: duration <= half;
        8'b00100000: duration <= half;
        8'b01000000: duration <= half;
        8'b10000000: duration <= whole;
        default: duration <= 0;
    endcase

    if (duration > 0 && frequency > 0) begin
        speaker <= speaker ^ 1;
        #10;
        speaker <= speaker ^ 1;
        #10;
        duration <= duration - 20;
    end
end

endmodule
