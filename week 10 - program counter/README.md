For Ubuntu/Debian-based systems:
```bash
iverilog -o test lib.v pc.v pc_tb.v

vvp test

gtkwave tb_pc.vcd