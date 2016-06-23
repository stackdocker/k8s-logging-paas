curl -XPUT http://10.3.0.18:9200/template_k8s_logstash -d '
{
    "template" : "logstash-*",
    "settings" : {
      "index.refresh_interval" : "5s"
    },
    "mappings" : {
      "_default_" : {
        "dynamic_templates" : [ {
          "kubernetes_field" : {
            "path_match" : "kubernetes.*",
            "mapping" : {
              "type" : "string",
              "index" : "not_analyzed"
            }
          }
        } ]
      }
    }
  }'
