#python-aws-lambda

To create a new python lambda project, run
    `$ create_lambda.sh <function_name> new`

For example:
    `$ create_lambda.sh tempfunction new`

This will create the following folder structure:

    <function_name (virtualenv)>
    .. virtualenv directories..
    --app
        --handler.py
    --build.sh

To update the build.sh script of an existing lambda function, run the same thing
without the **new** argument:

    `$ create_lambda.sh <function_name>`

In amazon lambda console, provide handler.handler as function to be invoker.

To build, build.sh which will create a dist.zip which can then be uploaded.

All packages installed via pip will be included in the dist.zip
