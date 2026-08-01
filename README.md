# Verilog HDL Digital IP Library
Turning digital logic circuits into verilog code.

This repository serves as a functional digital design catalog written in **verilog**. It showcases practical implementations leveraging **Dataflow Modeling** (via continuous `assign` statements) alongside structural and behavioral RTL abstractions, functional simulation, and gate-level synthesis pipelines.

## Highlights
* **Dataflow & RTL Abstractions:** Designs structured around explicit data paths, continuous assignments, and concurrent logic flow.
* **Modular IP Blocks:** Standardized module structures for easy instantiation in larger digital systems.
* **Complete Verification Toolchain:** Integrated simulation scripts ensuring functional compliance across all designs.
* **Open-Source EDA Stack:** Fully automated workflow built using `iverilog`, `gtkwave`, and `yosys`.

## EDA Tools & Workflow

* **Code Compiling:** Icarus Verilog — Compiles RTL design modules and testbenches into simulation targets
* **Simulation & Waveform:** GTKWave — Visualizes signal timing transitions and output logic via VCD files
* **Logic Synthesis:** Yosys — Maps high-level RTL code to gate-level structural netlists
* **Schematic Visualizer:** Graphviz — Renders visual hardware schematics directly from synthesized output

## Simulation and Execution Guide

Here is a reusable command template you can use for any future Verilog simulation.
Just replace <design> and <testbench> with your actual file names!
Standard Reusable Command Format
Run these 3 commands in your cmd terminal in order:

:: 1. **Compile**
iverilog -o <output_name>.vvp <design_file>.v <testbench_file>.v

:: 2. **Execute Simulation**
vvp <output_name>.vvp

:: 3. **View Waveform**
gtkwave <vcd_filename>.vcd


**Quick Example Lookup**
If your files are named full_adder.v and full_adder_tb.v (and your testbench creates full_adder_tb.vcd):

iverilog -o fa_sim.vvp full_adder.v full_adder_tb.v
vvp fa_sim.vvp
gtkwave full_adder_tb.vcd


**Checklist Before Running**
To ensure the commands run smoothly every time, make sure:
$dumpfile("your_name.vcd"); and $dumpfile_vars / $dumpvars(0, tb_name); are inside the initial block of your testbench.
The .vcd filename in Command 3 matches whatever name you passed to $dumpfile() in your testbench.
You are running the commands inside cmd (Command Prompt), not PowerShell.

**Here is the quick check-list for **Synthesis** to keep in mind for every project you do**:
The Workflow in 4 Easy Steps
1. Create your Verilog file (e.g., and_gate.v) and write your module logic. Save it.
2. Create your script file (e.g., synth.ys), paste the script lines, and update the file/module names so they match your new Verilog design:
   Update read_verilog <your_file.v>
   Update hierarchy -top <your_module_name>
   Update output names in write_verilog and show

 A. To run a new Verilog module using the same synth.ys file, you only need to change 4 items (plus 1 tweak for the .dot extension setup).
Here is the exact breakdown:
    i. The 4 Changes to Make
       read_verilog <YOUR_NEW_FILE.v>          # Change 1: Your input Verilog filename
       hierarchy -top <YOUR_MODULE_NAME>       # Change 2: The top module name inside your code
       proc; opt; techmap; opt
       write_verilog <NEW_SYNTH_FILE.v>        # Change 3: Output synthesized file name
       show -format dot -prefix <NEW_SCHEMATIC> # Change 4 & Tweak: Output schematic prefix + 'dot' format
       
    ii. Example: Testing a Full Adder
       If you create a file named full_adder.v with module full_adder(...):
       read_verilog full_adder.v
       hierarchy -top full_adder
       proc; opt; techmap; opt
       write_verilog full_adder_synth.v
       show -format dot -prefix full_adder_schematic
       
3. Run in Command Prompt (cmd):
    yosys -s synth.ys
   
4. Open & View: Click the generated .dot file in VS Code's sidebar and hit Ctrl + Shift + V to preview the diagram.

**Pro-Tip for Fast Setup**
You don't even need to create a new .ys file every single time! You can just edit the file names inside your existing synth.ys file whenever you test a new design.
You've officially got the whole Yosys synthesis flow locked down!

