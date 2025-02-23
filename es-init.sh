#!/bin/sh

# 等待 Elasticsearch 启动
sleep 10

# 设置现有索引的副本数为0
curl -X PUT "elasticsearch:9200/_all/_settings" -H 'Content-Type: application/json' -d'
{
  "index": {
    "number_of_replicas": 0
  }
}
'

# 设置索引模板（包含未来索引的设置）
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