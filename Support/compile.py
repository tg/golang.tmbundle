#!/usr/bin/env python

import sys
import os
import os.path
import subprocess
import tempfile

def run(cmd, go=False, name=None):
	if name == None:
		name = os.path.basename(cmd[0])

	if go:
		cmd = [os.environ.get("TM_GO", "go")] + cmd

	returncode = -1

	try:
		returncode = subprocess.call(cmd)
	except Exception, e:
		print >>sys.stderr, "! Failed to run '%s': %s" % (cmd, e)

	return returncode

if __name__ == '__main__':
	if len(sys.argv) > 1 and sys.argv[1] == "--version":
		print "compile0.1"
		exit(0)

	path = sys.argv[1] if len(sys.argv) > 1 else '.'

	compilers = os.environ.get("TM_GOCOMPILERS")
	if compilers == None:
		print "! TM_GOCOMPILERS is not set. " \
			  "Specify semicolon-separated list of commands to run. " \
			  "'go tool vet' and 'go build' are always executed. " \
			  "Set empty TM_GOCOMPILERS to discard this message."
		compilers = ""

	cmds = [c.split(" ") for c in [c.strip() for c in compilers.split(";")] if c]

	# Run user commands
	for cmd in cmds:
		run(cmd + [path])

	# Run vet
	run(["tool", "vet", path], go=True, name="vet")

	# Run build
	with tempfile.NamedTemporaryFile() as tmpf:
		r = run(["build", "-o", tmpf.name, path], go=True)
		exit(r)