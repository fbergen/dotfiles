#!/usr/bin/env python

import sys
import json
import csv
import io
import argparse

def read_records(f):
    for line in f:
        yield json.loads(line)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Convert jsonlines file to csv.')
    parser.add_argument('--fields', metavar='field', required=True,
                        help='A comma separated list of fieldnames in the json object to output to csv')
    parser.add_argument('in', nargs='?', metavar='jsonl_in', type=argparse.FileType('r'), default=sys.stdin,
                        help='Infile to parse, should be in json lines format, defaults to stdin')
    parser.add_argument('out', nargs='?', metavar='csv_out', type=argparse.FileType('w'), default=sys.stdout,
                        help='csv output file to write, detaults to stdout')
    args = parser.parse_args()
    writer = csv.DictWriter(args.out, fieldnames=args.fields.split(','), extrasaction='ignore')
    writer.writeheader()
    for row in read_records(vars(args)['in']):
        writer.writerow(row)

