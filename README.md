# participant-app-router

Router side Repository.

[Server side](https://github.com/higuruchi/participant-app)

[Client side](https://github.com/yassi-github/participant-app-client)


## Specifications

This will POST Mac addresses and date to Participant-app server by using curl.

The IP and port of the server are defined by the arguments of `setup.sh`.


## Requirements

- `unzip`
    - For Downloading This Repository.
- `curl`

## Usage

```bash
# Download Repository
curl https://codeload.github.com/yassi-github/participant-app-router/zip/refs/heads/master -o participant-app-router-master.zip

unzip participant-app-router-master.zip

cd participant-app-router-master

# run
# Specify Servere-side IP:Port
sudo ./setup.sh <ServerIP>:<ServerPORT>
# e.g.
# sudo ./setup.sh 192.0.2.10:8080
```

This will restart cron.  

Check how it works:

```
logread -e cron
```
