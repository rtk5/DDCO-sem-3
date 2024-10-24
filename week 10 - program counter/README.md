For Ubuntu/Debian-based systems:
```bash
iverilog -o test lib.v pc.v pc_tb.v
'''

```bash
vvp test
'''

```bash
gtkwave tb_pc.vcd
'''