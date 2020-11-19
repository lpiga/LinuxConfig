import subprocess
import time

class Cmd:
    def __init__(self, output, err, retcode, elapsed):
        self.stdout = output
        self.stderr = err
        self.ret = retcode
        self.elapsed = elapsed

def run_cmd(args, live_output=True):
    start = time.time()
    process = None
    if not live_output:
        process = subprocess.Popen(args,
                                   stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE)
    else:
        process = subprocess.Popen(args)
    output, err = process.communicate()
    elapsed = time.time()
    elapsed = elapsed - start
    retcode = process.returncode
    return Cmd(output, err, retcode, elapsed)
