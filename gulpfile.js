const
    gulp = require('gulp'),
    watch = require('gulp-watch'),
    batch = require('gulp-batch'),
    yargs = require('yargs'),
    run = require('gulp-run'),
    dateFormat = require('dateformat'),
    log = console.log.bind(console);

const argv = yargs
    .option('source', {
        alias: 's',
        description: 'Source for whatcher',
        type: 'string',
    })
    .option('notecommands', {
        alias: 'n',
        description: 'Command to run on end-event in note',
        type: 'string',
    })
    .option('commands', {
        alias: 'c',
        description: 'Command to run on end-event local',
        type: 'string',
    })
    .option('workspace', {
        alias: 'w',
        description: 'Define the remote workspace.',
        type: 'string',
    })
    .help()
    .alias('help', 'h')
    .argv;

gulp.task('watch', function () {
    watch(argv.source, {
        ignored: /.git|.idea/,
    }, batch(function (events, done) {
        events.on('data', function (file) {
            if (file.history.length > 1) {
                log(file.history)
            }
            workspace = argv.workspace || "workspace"
            console.log(`WORKSPACE=${workspace}`)

            changed_file = file.history[0]
            orig = changed_file.replace(`${file.cwd}/`, "");
            dest = changed_file.replace("/mnt/c/Users/heito/IdeaProjects", `${workspace}/`);

            switch(file.event) {
                case 'add':
                case 'change':
                    log(`coping ${orig} to ${dest}`)
                    run(`scp ${orig} note:${dest}`).exec();
                    break;
                case 'unlink':
                    log(`removing ${dest}`);
                    run(`ssh note "rm ${dest}"`).exec();
                    break;
            }

        }).on('end', function() {
            runs = ""
            if (argv.notecommands) {
                cmd = `${argv.notecommands}`.replace(",", " && ")
                runs = `ssh note -t "cd workspace/${argv.source}; ${cmd}"`;
            }
            if (argv.commands) {
                cmd = `${argv.commands}`.replace(",", " && ")
                if (runs) {
                    runs = `${runs} && `
                }
                runs = `${runs}${cmd}`;
            }
            log(`running ${runs}`);
            run(`${runs}`).exec();
            console.log(`[${dateFormat(Date(), "dd/mm/yyyy - HH:MM:ss")}]`)
            done()
        });
    }));
});

exports.default = () => gulp.task('watch')();
