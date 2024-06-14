under_test = dds_tb
under_test_path = ./test/${under_test}.v
out_file = ./test/${under_test}.out
all:
	openlane --last-run --flow classic config.json

view:
	openlane --last-run --flow openinopenroad config.json

testbench:
	iverilog -o ${out_file} src/*.v ${under_test_path}
	vvp ${out_file} > log.txt
	python3 read_and_plot.py

