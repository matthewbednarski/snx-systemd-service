# scripts-systemd

This repository provides automation for installing and managing a custom systemd service (`snx.service`) and its associated Expect script (`snx-login.exp`). The Makefile streamlines installation, enabling, starting, stopping, and monitoring of the service.

## Structure

- `bin/snx-login.exp`: The Expect script to be installed as `/usr/bin/snx-login.exp`.
- `system/snx.service`: The systemd unit file to be installed as `/etc/systemd/system/snx.service`.
- `Makefile`: Automates installation and management tasks.

## Prerequisites

- `expect` must be installed on your system.
- A password file must exist at `/root/snx-password.txt`.

## Installation

```sh
sudo make install
```

This will:
- Check for prerequisites.
- Install the Expect script to `/usr/bin/snx-login.exp`.
- Install the systemd service file to `/etc/systemd/system/snx.service`.
- Enable and reload the systemd service.

## Usage

- **Enable service:** `sudo make enable`
- **Start service:** `sudo make start`
- **Stop service:** `sudo make stop`
- **Disable service:** `sudo make disable`
- **Check status:** `sudo make status`
- **View logs:** `sudo make logs`

## Notes

- Edit `bin/snx-login.exp` and `system/snx.service` as needed for your environment.
- Ensure `/root/snx-password.txt` exists and is secured.
