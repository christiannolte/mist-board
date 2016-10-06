// A simple system-on-a-chip (SoC) for the MiST
// (c) 2015 Till Harbaum
// Port to TR-Tech WXEDA Board by Christian Nolte

module soc (
   input [1:0] CLOCK_48,
   output SDRAM_nCS,
   output VGA_HS,
   output VGA_VS,
   output [5:0] VGA_R,
   output [5:0] VGA_G,
   output [5:0] VGA_B
);

// de-activate unused SDRAM
assign SDRAM_nCS = 1;

wire pixel_clock;

vga vga (
	 .pclk  (pixel_clock),
	 .hs    (VGA_HS),
	 .vs    (VGA_VS),
	 .r     (VGA_R),
	 .g     (VGA_G),
	 .b     (VGA_B)
);
					
// A PLL to derive the VGA pixel clocl from the WXEDA 48MHz
pll pll (
	 .inclk0(CLOCK_48[0]),
	 .c0(pixel_clock)        // 31.5 MHz
);

endmodule
