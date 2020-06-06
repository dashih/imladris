"use strict";

const exec = require("child_process").exec;
const util = require("util");

exec("ssh root@192.168.1.64 'mdadm --detail /dev/md2'", (err, stdout, stderr) => {
    if (err != null) {
        console.error(err);
        return;
    }

    let m = stdout.match(/[\s\S]*State : ([a-z]+)\s/);
    let status = m[1];


    if (status != "clean" || status != "active") {
        exec(util.format("echo -e \"%s\" | mailx -s \"NAS RAID not healthy!\" dss4f@dannyshih.net", stdout), (errEmail, stdoutEmail, stderrEmail) => {
            if (errEmail != null) {
                console.error(errEmail);
            }
        });
    }
});
