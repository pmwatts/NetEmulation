// File: config.sv
// Philip Watts, University College London, June 2012
//
// This file defines the top level parameters for FPGA emulation
// of networks on chip

`include "functions.sv";

// Network parameters 
`define X_PORTS       2        
`define Y_PORTS       2
`define PORTS                     (`X_PORTS * `Y_PORTS)
`define FIFO_DEPTH                 8
`define PAYLOAD                   64        // Packet payload in bits
`define PKT_SIZE                  (`PAYLOAD+(2*log2AndRoundUp(`PORTS))+1)

// Optical timing parameters
`define SLOT_SIZE   8         // For fixed slot size networks, in clock cycles
`define TOF         2
`define SERIAL      4

// Simulation timing parameters
`define CLK_PERIOD      5ns
`define WARMUP_PERIOD   1us
`define MEASURE_PERIOD  10us
`define COOLDOWN_PERIOD 1us

// Load parameters
`define SEED        13649
`define LOAD        30           // in %

`define RATE        (4294967295/(100*`SLOT_SIZE))*`LOAD    // This is for a time slotted optical network
                                                           // Max load is 2^32-1 = 4294967295 (1 pkt per port per clock cycle)
// Add rate calculations for other networks and (un)comment as required

// Traffic type (only one should be uncommented)
`define UNIFORM
//`define HOTSPOT
// Also should parameterise the hotspot - currently sends to middle cores in
// a mesh network
//`define STREAM
//`define STREAMRATE 1.4 // Rate of the stream test
// Could also parameterise stream ports - currently hard coded to 1 - 10
//`define TRACE

// Arbiter implementation parameters
`define LOOKAHEAD 4   // Removed from the instantiation in simple_alloc - add instead directly in arbiter code
                      // (as not all arbiter types require this parameter)

// Coment this out if the network is in SystemVerilog
//`define VHDL

// Comment this out for simulation
//`define SYNTHESIS

// Optical Network Parameters
`define VC        // Implements virtula channel queues and separable allocator
                  // otherwise you get a single input FIFO and arbiter per port

// VCD File Generation (for power analysis)
//`define VCD_PATH "inst_net/inst_alloc"

// Define the packet structure
typedef struct packed {
	 logic [`PAYLOAD-1:0] data;
	 /*
	 logic [divideBy2andRoundUp(log2AndRoundUp(`PORTS))-1:0] source_x;
	 logic [divideBy2andRoundUp(log2AndRoundUp(`PORTS))-1:0] source_y; */
	 
	 logic [log2AndRoundUp(`X_PORTS)-1:0] source_x;
   logic [log2AndRoundUp(`Y_PORTS)-1:0] source_y;
	 logic [log2AndRoundUp(`X_PORTS)-1:0] dest_x;
	 logic [log2AndRoundUp(`Y_PORTS)-1:0] dest_y;
	 logic valid;
	 //logic parity;   // to be implemented later
	     } packet_t;

// Derived parameters (do not change)

