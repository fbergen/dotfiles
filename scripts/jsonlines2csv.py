#!/usr/bin/env python

import sys
import json
import csv
import argparse
import copy

def read_records(f):
    for line in f:
        yield json.loads(line)

def flatten(records):
    """
    Flatten the record and creating top level "." separated keys for nested records.
    This will still keep any nested records so that we can still lookup by first level keys
    e.g.
    in: {foo: {bar: baz}}
    out: {foo.bar: {baz}, foo: {bar: baz}}
    """
    for record in records:
        # Copy the record to make sure we keep the old structure too.
        flat = record
        flatten_recursive(record, flat, parent="")
        yield flat

def flatten_recursive(record, out, parent=""):
    for key, value in record.items():
        new_parent = parent + "." + key if parent else key
        if isinstance(value, dict):
            flatten_recursive(value, out, parent=new_parent)
        else:
            out[new_parent] = value

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Convert jsonlines file to csv.')
    parser.add_argument('--fields', metavar='field', required=True,
                        help='A comma separated list of fieldnames in the json object to output to csv. ' +
                             'If flattening is enabled, also support dot-separated field names to lookup nested keys')
    parser.add_argument('--noflat', dest='noflat', action='store_const',
                        const=True, default=False,
                        help='Disable record flattening, can improve performance')
    parser.add_argument('in', nargs='?', metavar='jsonl_in', type=argparse.FileType('r'), default=sys.stdin,
                        help='Infile to parse, should be in json lines format, defaults to stdin')
    parser.add_argument('out', nargs='?', metavar='csv_out', type=argparse.FileType('w'), default=sys.stdout,
                        help='csv output file to write, detaults to stdout')
    args = parser.parse_args()
    writer = csv.DictWriter(args.out, fieldnames=args.fields.split(','), extrasaction='ignore')
    writer.writeheader()

    records = read_records(vars(args)['in'])
    if not args.noflat:
        # We should flatten
        records = flatten(records)
    for row in records:
        writer.writerow(row)
