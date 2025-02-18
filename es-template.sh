#!/bin/bash
sleep 10
curl -X PUT "http://elasticsearch:9200/_index_template/my-logs" -H "Content-Type: application/json" -d'
{
  "index_patterns": ["my-logs-*"],
  "template": {
    "settings": {
      "number_of_shards": 1,
      "number_of_replicas": 0
    },
    "mappings": {
      "dynamic": true,
      "properties": {
        "@timestamp": {
          "type": "date"
        },
        "data": {
          "type": "text"
        }
      }
    }
  }
}'
