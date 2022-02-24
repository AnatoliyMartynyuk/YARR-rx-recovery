`timescale 1ns/1ps

module sim_iserdes2();

	localparam CLK_PERIOD = 5ns;
	localparam WIDTH = 4;
	
	logic clk, clk_2, clk_div, rst;
	logic input1, input2;
	logic bitslip;
	
	
	logic [WIDTH-1:0] out;
	logic comb_out;

    // clk generation 
    initial begin
        clk = '1;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
	
    initial begin
        clk_2 = '1;
        forever #(CLK_PERIOD/4) clk_2 = ~clk_2;
    end

    // clk_div generation
    initial begin
        clk_div = '1;
        forever #(CLK_PERIOD/2) clk_div = ~clk_div;
    end

	
	/*
	always_ff @(posedge clk_rx_i) begin
        serdes_bitslip <= (serdes_data32_valid) ? 1 : 0;
        serdes_bitslip <= '0;  
    end
	*/



	// DUT
	ISERDESE2 #(
		.DATA_RATE("DDR"),
		.DATA_WIDTH(WIDTH),
		.INTERFACE_TYPE("NETWORKING")
	) dut (
		.D		 		(input1	),
		.DDLY	 		(input2	),     	
		.CE1     		(1'b1	),	// not sure     	
		.CE2     		(1'b1	),  // not sure 
		.CLK     		(clk	),	   		
		.CLKB    		(~clk	),    	
		.RST     		(rst	),     	
		.CLKDIV  		(clk_div),  	
		.CLKDIVP 		(1'b0	),  // not sure	
		.OCLK    		(1'b0	),  // not sure  	
		.OCLKB   		(1'b0	),  // not sure  	
		.DYNCLKSEL		(1'b0	),  // not sure 
		.DYNCLKDIVSEL	(1'b0	),	// not sure
		.SHIFTIN1		(1'b0	), 	// not sure
		.SHIFTIN2		(1'b0	), 	// not sure
		.BITSLIP 		(bitslip), 	
		.OFB			(1'b0	), 	// not sure
		.O 				(comb_out),
		//.Q8				(out[0]),  	
		//.Q7				(out[1]),  	
		//.Q6				(out[2]),  	
		//.Q5				(out[3]),  	
		//.Q4				(out[4]),  	
		//.Q3				(out[5]),  	
		//.Q2				(out[6]),  	
		//.Q1				(out[7]),
		.Q8				(out[7]),
        .Q7				(out[6]),
        .Q6				(out[5]),
        .Q5				(out[4]),
        .Q4				(out[3]),
        .Q3				(out[2]),
        .Q2				(out[1]),
		.Q1				(out[0]),
		.SHIFTOUT1		(),
		.SHIFTOUT2		()
	);
	
	
	logic [WIDTH-1:0] input_word;
	task write_word (input logic [WIDTH-1:0] word);
        begin
			for (int i = WIDTH-1; i >= 0; i--) begin
				input1 <= word[i];  @(posedge clk_2); 
			end
			input_word = word;
        end
    endtask  
	
	
	logic align;
	logic rotate;
	
	initial begin
		input1 = '0; input2 = '0; rst = 1;
		#10ns rst = 0;
		
		write_word('ha);
		write_word('ha);
		write_word('ha);
		
		while (align != 1) begin
			write_word('h1);
		end
		
		write_word('h1);
		write_word('h1);
		write_word('h1);
		write_word('h8);
		write_word('h4);
		write_word('h2);
		write_word('h1);
		
		while (rotate != 1) begin
			write_word('h1);
		end
		
		write_word('h1);
		write_word('h1);
		write_word('h1);
		write_word('h8);
		write_word('h4);
		write_word('h2);
		write_word('h1);
	end
	
	
	initial begin
		bitslip = '0; align = 0; rotate = 0;
		
		#100ns;
		
		while(out != 'h1) begin
			wait(comb_out == 0);
			wait(comb_out == 1);
			wait(comb_out == 0);
			wait(comb_out == 1);
			wait(comb_out == 0);
			if (out != 'h1) begin
				@(negedge clk_div); bitslip = 1;
				@(negedge clk_div); bitslip = 0;
			end
		end
		
		align = 1;
		
		wait(out == 'h2); $display($time);
		wait(comb_out == 0);
		wait(comb_out == 1);
		wait(comb_out == 0);
		@(negedge clk_div); bitslip = 1; $display($time);
		@(negedge clk_div); bitslip = 0; $display($time);
		
		#10ns;
		
		while(out != 'h1) begin
			wait(comb_out == 0);
			wait(comb_out == 1);
			wait(comb_out == 0);
			wait(comb_out == 1);
			wait(comb_out == 0);
			if (out != 'h1) begin
				@(negedge clk_div); bitslip = 1; $display($time);
				@(negedge clk_div); bitslip = 0; $display($time);
			end
		end
		
		rotate = 1;
	end
	

	/*
	// the rest
	initial begin
		input1 = '0; input2 = '0; rst = 1;
		#10ns rst = 0;
		
		write_word(8'haa);
		write_word(8'haa);
		write_word(8'haa);
		write_word(8'haa);
		write_word(8'haa);

		while (1) write_word(8'h01);
	end
	
	initial begin
		bitslip = '0;
		wait (out == 'h08);
		wait(comb_out == 0);
		wait(comb_out == 1);
		wait(comb_out == 0);
		bitslip <= 1; @(negedge clk_div);
		bitslip <= 0; @(negedge clk_div);
		
		wait(comb_out == 0);
		wait(comb_out == 1);
		wait(comb_out == 0);
		wait(comb_out == 0);
		wait(comb_out == 1);
		wait(comb_out == 0);
		bitslip <= 1; @(negedge clk_div);
		bitslip <= 0; @(negedge clk_div);
		
		wait(comb_out == 0);
		wait(comb_out == 1);
		wait(comb_out == 0);
		wait(comb_out == 0);
		wait(comb_out == 1);
		wait(comb_out == 0);
		bitslip <= 1; @(negedge clk_div);
		bitslip <= 0; @(negedge clk_div);
		
		wait(comb_out == 0);
		wait(comb_out == 1);
		wait(comb_out == 0);
		wait(comb_out == 0);
		wait(comb_out == 1);
		wait(comb_out == 0);
		bitslip <= 1; @(negedge clk_div);
		bitslip <= 0; @(negedge clk_div);
		
		wait(comb_out == 0);
		wait(comb_out == 1);
		wait(comb_out == 0);
		wait(comb_out == 0);
		wait(comb_out == 1);
		wait(comb_out == 0);
		bitslip <= 1; @(negedge clk_div);
		bitslip <= 0; @(negedge clk_div);
		
	end
	*/
	
endmodule