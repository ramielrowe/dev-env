This dev environment involves two machines, a devstack machine and a stacktach machine.

### Step 1 ###

Install devstack on one machine.

### Step 2 ###

Add notification config to nova.conf

/etc/nova/nova.conf

    notification_driver=nova.openstack.common.notifier.rabbit_notifier
    notification_topics=monitor,notifications
    notify_on_state_change=vm_and_task_state
    notify_on_any_change=True
    instance_usage_audit=True
    instance_usage_audit_period=hour

### Step 2 ###

Pull down this repo on your stacktach machine.

### Step 3 ###

Create config files.
(dev-env-settings.sh and stacktach-config.sh)

### Step 4 (optional) ###

Run dev-env.sh

### Step 5 (optional) ###

Run stacktach.sh
Attach to stacktach screen

    screen -x stacktach
