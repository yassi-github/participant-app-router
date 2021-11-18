# participant-app-router
Router side Repository of https://github.com/higuruchi/participant-app

# 仕様

## show-participants-data.sh

現在時刻と ARP テーブルの MAC address を羅列した JSON データを出力する。

例:
```json
{
    "year": 2021,
    "month": 11,
    "day": 16,
    "hour": 14,
    "minute": 11,
    "second": 54,
    "macaddresses": [
        "c4:3c:ea:85:f0:08",
        "2c:d0:5a:27:82:3e"
    ]
}
```
