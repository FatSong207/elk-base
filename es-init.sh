#!/bin/sh

# 等待 Elasticsearch 启动
sleep 10

# 设置所有索引的副本数为0
curl -X PUT "elasticsearch:9200/_all/_settings" -H 'Content-Type: application/json' -d'
{
  "index": {
    "number_of_replicas": 0
  }
}
'

# 运行原来的模板脚本
sh /es-template.sh 