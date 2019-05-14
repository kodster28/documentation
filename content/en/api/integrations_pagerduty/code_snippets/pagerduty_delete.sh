#!/bin/sh
# Make sure you replace the <DD_API_KEY> and <DD_APP_KEY> key below
# with the ones for your account

api_key=<DD_API_KEY>
app_key=<DD_APP_KEY>

curl -v -X DELETE \
"https://api.datadoghq.com/api/v1/integration/pagerduty?api_key=${api_key}&application_key=${app_key}"