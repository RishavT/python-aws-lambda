# python-aws-lambda

To create a new python lambda project, run
    `$ create_lambda.sh <function_name>`

For example:
    `$ create_lambda.sh tempfunction`

This will create the following folder structure:

    <function_name (virtualenv)>
    .. virtualenv directories..
    --app
        --handler.py
    --build.sh

In amazon lambda console, provide handler.handler as function to be invoker.

To build, build.sh which will create a dist.zip which can then be uploaded.

All packages installed via pip will be included in the dist.zip

## TODO List:

* Add git support - automatic pulling from a git repo while project creation, and possibly support for git hooks in the future.
* Add `make` support.
* Build packages for distribution.
* Make a server hostable version (which will be using git hooks).
