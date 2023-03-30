resource "datadog_dashboard" "ordered_dashboard" {
  title       = "Our Dashboard with TerraForm"
  layout_type = "ordered"


  widget {
    group_definition {
      title            = "Lambda"
      layout_type      = "ordered"
      background_color = "green"

      widget {
        query_value_definition {
          live_span = "1mo"
          title     = "Lambda Invocations"
          precision = 0
          autoscale = true
          request {
            q = "sum:aws.lambda.invocations{*}.as_count()"
            conditional_formats {
              comparator = "<"
              value      = "2500"
              palette    = "white_on_green"
            }
          }

        }
      }
      widget {
        toplist_definition {
          title     = "Top 10 Lambda Invocations"
          live_span = "1mo"
          request {
            style {
              palette = "dog_classic"
            }
            q = "sum:aws.lambda.invocations{*} by {functionname}.as_count()"
          }
        }
      }
      widget {

        query_value_definition {
          title     = "Lambda Errors"
          live_span = "1d"
          autoscale = true
          request {
            q = "sum:aws.lambda.errors{*}.as_count()"
            conditional_formats {
              comparator = "<"
              value      = "5"
              palette    = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value      = "5"
              palette    = "white_on_red"
            }
          }
        }
      }
    }
  }
  widget {
    group_definition {
      title            = "Infrastructure"
      layout_type      = "ordered"
      background_color = "orange"

      widget {
        hostmap_definition {
          title           = "Host Map"
          group           = ["region"]
          no_group_hosts  = true
          no_metric_hosts = true
          request {
            fill {
              q = "avg:system.cpu.user{*} by {host}"
            }
          }
        }
      }



    }
  }


}