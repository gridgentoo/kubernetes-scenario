To locally develop and run Python code, it is recommended to use a Python virtual environment. Run the following commands to create and activate a virtual environment named `.venv`.

`apt-get update`{{execute T1}}

`yes | apt-get install python3-venv`{{execute T1}}

`python3 -m venv .venv`{{execute T1}}

`source .venv/bin/activate`{{execute T1}}
