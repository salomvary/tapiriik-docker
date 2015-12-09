#!/bin/sh
set -euf

# Wait for RabbitMQ to boot up
while ! nc -q 1 rabbitmq 5672 </dev/null; do sleep 1; done

# Chokes on non-absolute path!
python3 /tapiriik/sync_worker.py
