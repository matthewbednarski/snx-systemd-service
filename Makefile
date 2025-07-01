# generated with: generate a makefile, which links or copies the snx-login.exp to the /usr/bin directory and installs the system/snx.service unit file in the /etc/systemd/system directory, and calls systemctl daemon-reload
# Makefile to install snx-login.exp and systemd service

PASSWORD_FILE=/root/snx-password.txt

SERVICE_NAME = snx
BIN_FILENAME = $(SERVICE_NAME)-login.exp

INSTALL_BIN = /usr/bin/$(BIN_FILENAME)
SERVICE_FILE = /etc/systemd/system/$(SERVICE_NAME).service
SRC_BIN = bin/$(BIN_FILENAME)
SRC_SERVICE = system/$(SERVICE_NAME).service

.pre_expect:
	which expect >/dev/null 2>&1 || (echo "Expect is not installed. Please install it first." && exit 1)

.pre_password_file:
	[ -f $(PASSWORD_FILE) ] || (echo "Password file $(PASSWORD_FILE) does not exist. Please create it." && exit 1)
	

prerequisites: .pre_expect .pre_password_file

install: prerequisites .install_script .install_service reload

.install_service:
	install -m 0644 $(SRC_SERVICE) $(SERVICE_FILE)
.install_script:
	install -m 0755 $(SRC_BIN) $(INSTALL_BIN)

enable:
	systemctl enable $(SERVICE_NAME).service

reload: enable
	systemctl daemon-reload

disable: stop
	systemctl disable $(SERVICE_NAME).service

start: reload
	systemctl start $(SERVICE_NAME).service

stop:
	systemctl stop $(SERVICE_NAME).service

status:
	systemctl status $(SERVICE_NAME).service

logs:
	journalctl -u $(SERVICE_NAME).service -f

