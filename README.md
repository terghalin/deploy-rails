# deploy-rails

#### Deploy Rails application with attached PostgreSQL database and Puma

## Testing

### Prerequisites

Ruby Gems:
  * berkshelf
  * kitchen-docker
  * kitchen-inspec

For testing with Chef Test Kitchen, use `kitchen test` command

## Troubleshooting

### Kitchen

#### 1. Unable to connect to docker socket

This Test Kitchen uses kitchen-docker driver with TCP socket connection.
You can start docker with `--host` parameter:
```bash
-H tcp://127.0.0.1:2375
```

You can also change ExecStart parameter in Ubuntu 16.x at `/lib/systemd/system/docker.service`:

```bash
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://127.0.0.1:2375
```

#### 2. Unable to resolve archive.ubuntu.com and 8.8.8.8 while running with kitchen-docker

Your organization may block DNS 8.8.8.8 or 8.8.8.4. First, check your's DNS servers:
```bash
$ nmcli dev show | grep DNS
IP4.DNS[1]:                             10.0.0.1
IP4.DNS[2]:                             10.0.0.2
```

Create file `/etc/docker/daemon.json` and add DNS parameters for docker daemon:

```json
{
    "dns": ["10.0.0.1", "10.0.0.2"]
}

```
___
ChefDK required
