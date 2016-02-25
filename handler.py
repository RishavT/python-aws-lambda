"""Handler for the lambda function.
This the file which will run when the API endpoint is hit."""

def handler(event, context):
    """
    Handler function. This function will run when the API is hit.
    """
    print 'This function ran successfully. (event, context): '
    print event, context
    return event
