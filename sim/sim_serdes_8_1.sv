`timescale 1ns/1ps

module sim_serdes_8_1 ();
	
	localparam WIDTH = 8;
    localparam c_SLIP_SERDES_MAX = 8;
    localparam c_SERDES8_CYCLE = 1;

    localparam RX_CLK_PERIOD     = 6.4ns;
    localparam SERDES_CLK_PERIOD = 1.6ns;

    logic rx_data_i_p, rx_data_i_n;
    logic serdes_bitslip, serdes_idelay_rdy, serdes_lock;
    logic [7:0] serdes_data8;
    logic [4:0] bit_time_value;
    logic [31:0] eye_info, m_delay_1hot;

    logic rst;
    logic clk_rx_i, clk_serdes_i, clk_DDR;

    // clk_rx_i generation 
    initial begin
        clk_rx_i = '0;
        forever #(RX_CLK_PERIOD/2) clk_rx_i = ~clk_rx_i;
    end

    // clk_serdes_i generation
    initial begin
        clk_serdes_i = '0;
        forever #(SERDES_CLK_PERIOD/2) clk_serdes_i = ~clk_serdes_i;
    end

    // clk_serdes_i generation
    initial begin
        clk_DDR = '0;
        forever #(SERDES_CLK_PERIOD/4) clk_DDR = ~clk_DDR;
    end
	
    //assign rx_data_i_n = ~rx_data_i_p;

    // DUT
    serdes_1_to_468_idelay_ddr #(
        .S(8),
        .D(1),
        .REF_FREQ(310.0),
        .HIGH_PERFORMANCE_MODE("TRUE"),
        .DATA_FORMAT("PER_CLOCK")
    ) dut (
        .datain_p               (rx_data_i_p        ), // incoming data (+)
        .datain_n               (~rx_data_i_p       ), // incoming data (-)
        .enable_phase_detector  (1'b1),                // copied from inline
        .enable_monitor         (1'b1),                // copied from inline
        .reset                  (rst                ), 
        .bitslip                (serdes_bitslip     ), // bitslip control (in)
        .idelay_rdy             (~rst               ), // (in) FIGURE THIS OUT
        .rxclk                  (clk_serdes_i       ), // gen clock
        .system_clk             (clk_rx_i           ), // gen clock
        .rx_lckd                (serdes_lock        ), // (out)
        .rx_data                (serdes_data8       ), // output data
        .bit_rate_value         (16'h0640           ), // copied from inline
        .dcd_correct            (1'b0),                // copied from inline
        .bit_time_value         (bit_time_value     ), // out
        .debug                  (),
        .eye_info               (eye_info           ), // out
        .m_delay_1hot           (m_delay_1hot       ), // out
        .clock_sweep            ()
    );
	
	task write_word (input logic [WIDTH-1:0] word);
        begin
			for (int i = WIDTH-1; i >= 0; i--) begin
				rx_data_i_p <= word[i];  @(posedge clk_DDR); 
			end
        end
    endtask   
    


    assign rx_data_i_n = ~rx_data_i_p;

    initial begin
        rst = '1; rx_data_i_p = '1; #10ns;
        rst = '0;
		write_word(8'h55);
		write_word(8'h55);
		write_word(8'h55);
		write_word(8'h55);
		write_word(8'h55);
		write_word(8'h55);
		write_word(8'h55);
		write_word(8'h55);
		write_word(8'h55);
		write_word(8'h55);
		while(1) write_word(8'h01);
    end
	
	initial begin
		serdes_bitslip = '0;
		#450ns;
		
		while(serdes_data8 != 'h01) begin
			wait(rx_data_i_p == 0);
			wait(rx_data_i_p == 1);
			wait(rx_data_i_p == 0);
			wait(rx_data_i_p == 1);
			wait(rx_data_i_p == 0);
			wait(rx_data_i_p == 1);
			wait(rx_data_i_p == 0);
			wait(rx_data_i_p == 1);
			wait(rx_data_i_p == 0);
			wait(rx_data_i_p == 1);
			wait(rx_data_i_p == 0);
			wait(rx_data_i_p == 1);
			wait(rx_data_i_p == 0);
			wait(rx_data_i_p == 1);
			wait(rx_data_i_p == 0);
			wait(rx_data_i_p == 1);
			wait(rx_data_i_p == 0);
			if (serdes_data8 != 'h01) begin
				@(negedge clk_rx_i); serdes_bitslip = 1;
				@(negedge clk_rx_i); serdes_bitslip = 0;
			end
		end
	end

	/*
    logic [31:0] serdes_data32, serdes_data32_shift;
    logic serdes_data32_valid;
    logic [1:0] serdes_cnt, serdes8_cnt;


    always_ff @(posedge clk_rx_i, rst) begin
        if (rst) begin
            serdes_data32       <= '0;
            serdes_data32_shift <= '0;
            serdes_data32_valid <= '0;
            serdes_cnt          <= '0;
            serdes8_cnt         <= '0;
        end

        else begin
            serdes8_cnt         <= serdes8_cnt + 1;
            serdes_data32_valid <= '0;

            if (serdes8_cnt == 2'b01) begin
                serdes_cnt <= serdes_cnt + 1;
                serdes8_cnt <= '0;
                serdes_data32_shift[31:0] <= serdes_data32_shift[23:0];
                serdes_data32_shift[7:0]  <= serdes_data8;

                if (serdes_cnt == 2'b11) begin
                    serdes_data32 <= serdes_data32_shift;
                    serdes_data32_valid <= '1;
                    serdes_cnt <= '0;
                end
                
            end
        end
    end

    /*
    always_ff @(posedge clk_rx_i) begin
        serdes_bitslip <= (serdes_data32_valid) ? 1 : 0;
        serdes_bitslip <= '0;  
    end
	*/



	/*
        serdes_8to32_proc : process(clk_rx_i, rst_n_i)
        begin
            if (rst_n_i = '0') then
                serdes_data32       <= (others => '0');
                serdes_data32_shift <= (others => '0');
                serdes_data32_valid <= '0';
                serdes_cnt          <= (others => '0');
                serdes8_cnt         <= (others => '0');
                serdes_data8_d      <= (others => '0');
            elsif rising_edge(clk_rx_i) then
                serdes8_cnt <= serdes8_cnt + 1;
                serdes_data32_valid <= '0';
                if (serdes8_cnt = c_SERDES8_CYCLE) then
                    serdes_cnt <= serdes_cnt + 1;
                    --serdes_data8_d <= serdes_data8_s;
                    serdes_data32_shift(31 downto 8) <= serdes_data32_shift(23 downto 0);
                    serdes_data32_shift(7 downto 0) <= serdes_data8_s;
                    if (serdes_cnt = to_unsigned(3, 6)) then
                        serdes_data32 <= serdes_data32_shift(31 downto 0);
                        serdes_data32_valid <= '1';
                        serdes_cnt <= (others => '0');
                    end if;
                    serdes8_cnt <= (others => '0');
                end if;
            end if;
        end process serdes_8to32_proc;
        */
endmodule