# Ansible Role Telegraf [![Build Status](https://travis-ci.org/mkubenka/ansible-role-telegraf.svg?branch=master)](https://travis-ci.org/mkubenka/ansible-role-telegraf)

[Telegraf](https://www.influxdata.com/time-series-platform/telegraf/) is an agent written in Go for collecting metrics from the system it's running on, or from other services, and writing them into InfluxDB or other outputs.

> Inspired by https://github.com/dj-wasabi/ansible-telegraf

## Requirements

None

## Role Variables

The variables that can be passed to this role and a brief description about
them are as follows. (For all variables, take a look at [defaults/main.yml](defaults/main.yml))

```yaml

# Global tags.
telegraf_tags: 
  dc: 'us-east-1'

# Default data collection interval for all inputs.
telegraf_agent_interval: '10s'

# Default flushing interval for all outputs. You shouldn't set this below interval.
telegraf_agent_flush_interval: '10s'

# Override default hostname, if empty use os.Hostname().
telegraf_agent_hostname: ''

# Output plugins.
telegraf_outputs:
  influxdb:
    config:
      - urls = ["http://localhost:8086"]
      - database = "telegraf"

# Default input plugins.
telegraf_inputs_default:
  cpu:
    config:
      - percpu = true
      - totalcpu = true
      - fielddrop = ["time_*"]
  disk:
    config:
      - ignore_fs = ["tmpfs", "devtmpfs"]
  diskio:
  kernel:
  mem:
  processes:
  swap:
  system:

# Additional input plugins.
telegraf_inputs_extra: 
  ping:
    config:
      - urls = ["www.google.com"]
      - count = 1

```

## Dependencies

None

## Example Playbook

    - hosts: servers
      roles:
         - { role: mkubenka.telegraf }

## License

BSD

## Author Information

Michal Kubenka <mkubenka@gmail.com>
