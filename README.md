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


## Usage

```bash
git clone https://github.com/yassi-github/participant-app-router.git

cd participant-app-router

sudo ./setup.sh <ServerIP>:<ServerPORT>
# e.g.
# sudo ./setup.sh 192.0.2.10:8080
```

This will run `send-participant-mac@<IP>:<PORT>.timer`.  

Check how it works:

```
systemctl status send-participant-mac@<IP>:<PORT>.service
```

e.g. 

```
systemctl status send-participant-mac@192.0.2.10:8080.service
```
