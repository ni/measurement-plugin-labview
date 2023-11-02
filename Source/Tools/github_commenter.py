from __future__ import with_statement

import sys
import os
import logging
from post_pictures_to_pull_request import post_pictures_to_pull_request

# Taken from https://github.com/LabVIEW-DCAF/buildsystem/blob/master/steps/github_commenter.py

_moduleLogger = logging.getLogger(__name__)


def _parse_options(args):
    import optparse

    parser = optparse.OptionParser("usage: %prog [options] TOKEN PICS PR INFO")

    # Setup parser
    parser.add_option(
        "-t",
        "--token",
        dest="token",
        metavar="TOKEN",
        help="Github Access token needed to perform write operations",
    )
    parser.add_option(
        "-d",
        "--pic-dir",
        dest="picDir",
        metavar="PICS",
        help="Absolute path to the directory containing the pictures you want to upload",
    )
    parser.add_option(
        "-p",
        "--pull-req",
        dest="pr",
        metavar="PR",
        help="Github pull request number where you want to comment",
    )
    parser.add_option(
        "-i",
        "--info",
        dest="info",
        metavar="INFO",
        help="Information about the org, repo, and pull request you are trying to use, e.g. 'ni/niveristand-custom-device-build-tools/PR-13'",
    )
    parser.add_option(
        "-r",
        "--pic-repo",
        dest="picRepo",
        metavar="REPO",
        help="The owner and repo to post to on github, e.g. 'theSloopJohnB/thesloopjohnb' for https://github.com/theSloopJohnB/thesloopjohnb",
    )

    debugGroup = optparse.OptionGroup(parser, "Debug")
    debugGroup.add_option(
        "-v",
        "--verbose",
        action="count",
        dest="verbosity",
        default=0,
        help="Turn on verbose output. (Useful if you really care to see what the tool is doing at all times.)",
    )
    debugGroup.add_option(
        "-q",
        "--quiet",
        action="count",
        dest="quietness",
        default=0,
        help="Don't print anything to the module logger.",
    )
    debugGroup.add_option(
        "--test", action="store_true", dest="test", default=False, help="Run doctests then quit."
    )
    parser.add_option_group(debugGroup)

    (options, args) = parser.parse_args(args)

    # We want to default to WARNING
    # Quiet should make us only show CRITICAL
    # Verbosity gives us granularity to control past that
    verbosity = 2 + (2 * options.quietness) - options.verbosity
    loggingLevel = {
        0: logging.DEBUG,
        1: logging.INFO,
        2: logging.WARNING,
        3: logging.ERROR,
        4: logging.CRITICAL,
    }.get(verbosity, None)
    if loggingLevel is None:
        parser.error("Unsupported verbosity: %r" % verbosity)

    # Perform validation on results
    if options.test:
        return options, loggingLevel

    if args:
        parser.error("Positional arguments are not supported: %r" % (args,))

    if options.picDir is None or not os.path.exists(options.picDir):
        parser.error("Picture directory does not exist: %r" % options.picDir)

    return options, loggingLevel


def main(args):
    options, loggingLevel = _parse_options(args)

    logFormat = "(%(asctime)s) %(levelname)-5s %(name)s.%(funcName)s: %(message)s"
    logging.basicConfig(level=loggingLevel, format=logFormat)

    if options.test:
        import doctest

        print(doctest.testmod())
        return
    else:
        post_pictures_to_pull_request(
            options.token, options.picDir, options.info, options.pr, options.picRepo
        )

    return 0


if __name__ == "__main__":
    retCode = main(sys.argv[1:])
    sys.exit(retCode)
