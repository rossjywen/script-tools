#!/usr/bin/env python3

import xlwings
import sys
import getopt
import json

def dump_from_excel():
	excel_obj = xlwings.Book(input_file)

	sht = excel_obj.sheets[input_page]

	res = sht.range(start_cell + ':' + end_cell).value
	json_data = json.dumps(res, indent=4)
	
	if output_file == '':
		print(json_data)
	else:
		with open(output_file, 'w') as fobj:
			fobj.truncate(0)
			fobj.write(json_data)

		#with open(output_file, 'r+')as fobj:
		#	fc = fobj.read()
		#	jc = json.loads(fc)
		#	print(jc)


def print_usage():
	print('[usage]:')
	print(' -h/--help: print this info')
	print(' -i/--input= + excel file name to specify input (necessary)')
	print(' -p/--page= + excel sheet name or index (necessary)')
	print(' -o/--output= + file name specify output (optional)')
	print(' -s/--start= + start excel cell e.g a1/b5/c2... (necessary)')
	print(' -e/--end= + end excel cell e.g a2/c10/g100... (necessary)')


input_file=''
output_file=''
input_page=''
start_cell=''
end_cell=''

def args_parse(argv):
	global input_file
	global input_page
	global output_file
	global start_cell
	global end_cell


	parse, remainings = getopt.getopt(argv, '-h-i:-p:-s:-e:-o:', ['help', 'input=', 'page=', 'start=', 'end=', 'output='])
	#print(parse)
	for opt, arg in parse:
		if opt in ['-h', '--help']:
			print_usage()
			sys.exit(0)
		elif opt in ['-i', '--input']:
			input_file = arg
		elif opt in ['-p', '--page']:
			input_page = arg
		elif opt in ['-o', '--output']:
			output_file = arg
		elif opt in ['-s', '--start']:
			start_cell = arg
		elif opt in ['-e', '--end']:
			end_cell = arg
		else:
			pass

	if input_file == '':
		print('lack of input file name')
		print_usage()
		sys.exit(1)
	if input_page == '':
		print('lack of sheet name')
		print_usage()
		sys.exit(1)
	if start_cell == '':
		print('lack of start cell name')
		print_usage()
		sys.exit(1)
	if end_cell == '':
		print('lack of end cell name')
		print_usage()
		sys.exit(1)

	if remainings:
		print('following arguements are ignored')
		for item in remainings:
			print(item)


if __name__ == '__main__':
	args_parse(sys.argv[1:])
	
	dump_from_excel()


