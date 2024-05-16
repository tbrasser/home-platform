# kairos-config

# Folder Structure

In the root is `auroraboot-config.yaml`, this is passed to the AuroraBoot
container. Sometimes the container is also passed more sensitive options such
as `p2p.network_id` and `p2p.network_token`.

The `manifests` directory is where additional manifests that should
be applied to the cluster are located.

These are used in the `cloud_config` key like this:

```yaml
stages:
  boot:
    - name: "Add example manifest from this repo"
      downloads:
        - url: https://raw.githubusercontent.com/tbrasser/home-platform/main/manifests/example.yaml
          path: /var/lib/rancher/k3s/server/manifests/example.yaml
```

Of course, this requires the file to already be committed to the repository.
The official docs mention using gists as well, which is the same principle.

---

# Upgrades

`sudo kairos-agent upgrade [version]`

**Ensure upgrade applied successfully**

`sudo kairos-agent upgrade [version] --recovery`

**Ensure recovery upgraded successfully**

Then upgrade your AuroraBoot config for any new nodes that are added later.
